//
//  DoorLockRecordModel.m
//  
//
//  Created by Air on 15/12/4.
//
//

#import "HMDoorLockRecordModel.h"

@implementation HMDoorLockRecordModel

+(NSString *)tableName
{
    return @"doorLockRecord";
}
+ (BOOL)createTable
{
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists doorLockRecord("
                   "doorLockRecordId text,"
                   "uid text,"
                   "deviceId text,"
                   "authorizedId Integer,"
                   "type Integer,"
                   "time Integer,"
                   "createTime text,"
                   "updateTime text,"
                   "delFlag Integer,"
                   "UNIQUE(doorLockRecordId, uid) ON CONFLICT REPLACE)"];
    return result;
}

- (BOOL)insertObject
{
    NSString * sql = [NSString stringWithFormat:@"insert into doorLockRecord (doorLockRecordId,uid,deviceId,authorizedId,type,time,createTime,updateTime,delFlag) values('%@','%@','%@',%d,%d,%d,'%@','%@',%d)",self.doorLockRecordId,self.uid,self.deviceId,self.authorizedId,self.type,self.time,self.createTime,self.updateTime,self.delFlag];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
    
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from doorLockRecord where doorLockRecordId = '%@'",self.doorLockRecordId];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

+(NSMutableArray *)selectObjectWith:(NSString *)deviceID{
    NSMutableArray *arr = [NSMutableArray new];
        NSString *sql = [NSString stringWithFormat:@"select * from doorLockRecord where uid = '%@' and deviceId = '%@' and delFlag = 0 order by createTime desc",UID(),deviceID];
        //        NSString *sql = [NSString stringWithFormat:@"select * from doorLockRecord where uid = '%@' and deviceId = '%@' order by createTime desc",UID(),deviceID];
        queryDatabase(sql, ^(FMResultSet *rs) {
            
            HMDoorLockRecordModel *record = [HMDoorLockRecordModel object:rs];
            [arr addObject:record];
        });
  
  //      if ([authorId isEqualToString:@"10"]) {
//            NSString *sql = [NSString stringWithFormat:@"select * from doorLockRecord where uid = '%@' and deviceId = '%@' and authorizedId = 10 and delFlag = 0 order by createTime desc limit 1",UID(),deviceID];
    
//        }else{
//            NSString *sql = [NSString stringWithFormat:@"select * from doorLockRecord where uid = '%@' and deviceId = '%@' and authorizedId = '%@' order by createTime desc",UID(),deviceID,authorId];
//            queryDatabase(sql, ^(FMResultSet *rs) {
//                
//                DoorLockRecordModel *record = [DoorLockRecordModel object:rs];
//                [arr addObject:record];
//            });
//        }
    return arr;
}

+(HMDoorLockRecordModel *)selectLastObjectWith:(NSString *)deviceID withAuthorizedId:(int )authorizedId {
    __block HMDoorLockRecordModel *record = nil;
    if (!authorizedId) {
        NSString *sql = [NSString stringWithFormat:@"select * from doorLockRecord where uid = '%@' and deviceId = '%@' and delFlag = 0 order by createTime desc limit 1",UID(),deviceID];
        queryDatabase(sql, ^(FMResultSet *rs) {
            
            record = [HMDoorLockRecordModel object:rs];
        });
    }else{
        NSString *sql = [NSString stringWithFormat:@"select * from doorLockRecord where uid = '%@' and deviceId = '%@' and type = 4 and authorizedId =  %d and delFlag = 0 order by createTime desc limit 1",UID(),deviceID,authorizedId];
        queryDatabase(sql, ^(FMResultSet *rs) {
            
            record = [HMDoorLockRecordModel object:rs];
        });
    }
    
    return record;
}

+(BOOL )deleteRecordWithDeviceId:(NSString *)deviceID{
    NSString * sql = [NSString stringWithFormat:@"delete from doorLockRecord where deviceId = '%@'",deviceID];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}


@end
