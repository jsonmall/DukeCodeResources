//
//  AuthorizedUnlock.m
//  
//
//  Created by Air on 15/12/4.
//
//

#import "HMAuthorizedUnlockModel.h"

@implementation HMAuthorizedUnlockModel

+(NSString *)tableName
{
    return @"authorizedUnlock";
}
+ (BOOL)createTable
{
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists authorizedUnlock("
                   "authorizedUnlockId text,"
                   "uid text,"
                   "deviceId text,"
                   "authorizedId Integer,"
                   "phone text,"
                   "time Integer,"
                   "number Integer,"
                   "startTime Integer,"
                   "unlockNum Integer,"
                   "authorizeStatus Integer,"
                   "createTime text,"
                   "updateTime text,"
                   "delFlag integer,"
                   "UNIQUE(authorizedUnlockId, uid) ON CONFLICT REPLACE)"];
    return result;
}

- (BOOL)insertObject
{
    NSString * sql = [NSString stringWithFormat:@"insert into authorizedUnlock (authorizedUnlockId,uid,deviceId,authorizedId,phone,time,number,startTime,unlockNum,authorizeStatus,createTime,updateTime,delFlag) values('%@', '%@','%@',%d,'%@',%d,%d,%d,%d,%d,'%@','%@',%d)",self.authorizedUnlockId,self.uid,self.deviceId,self.authorizedId,self.phone,self.time,self.number,self.startTime,self.unlockNum,self.authorizeStatus,self.createTime,self.updateTime,self.delFlag];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
    
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from authorizedUnlock where authorizedUnlockId = '%@'",self.authorizedUnlockId];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

+ (HMAuthorizedUnlockModel *)SelectRecentUserWithDeviceId:(NSString *)deviceId{
    __block HMAuthorizedUnlockModel *unlock = nil;
    NSString *sql = [NSString stringWithFormat:@"select * from authorizedUnlock where uid = '%@' and deviceId = '%@' and delFlag = 0 order by createTime desc limit 1",UID(),deviceId];
    queryDatabase(sql, ^(FMResultSet *rs) {
        unlock = [HMAuthorizedUnlockModel object:rs];
    });
    return unlock;
}

@end
