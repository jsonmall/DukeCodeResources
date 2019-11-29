//
//  HMrStatusModel.m
//  HomeMate
//
//  Created by Air on 16/3/2.
//  Copyright © 2016年 Air. All rights reserved.
//

#import "HMrStatusModel.h"

@implementation HMrStatusModel

+(NSString *)tableName
{
    return @"rStatus";
}
+ (BOOL)createTable
{
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists rStatus ("
                   "rStatusId text,"
                   "uid text,"
                   "deviceId text,"
                   "value1 integer,"
                   "value2 integer,"
                   "value3 integer,"
                   "value4 integer,"
                   "createTime TEXT,"
                   "updateTime TEXT,"
                   "delFlag integer,"
                   "UNIQUE (rStatusId, uid) ON CONFLICT REPLACE)"];
    return result;
}


- (BOOL)insertObject
{

    NSString * sql = [NSString stringWithFormat:@"insert into rStatus (rStatusId,uid,deviceId,value1,value2,value3,value4,createTime,updateTime,delFlag) values('%@','%@','%@',%d,%d,%d,%d,'%@','%@',%d)",self.rStatusId,self.uid,self.deviceId,self.value1,self.value2,self.value3,self.value4,self.createTime,self.updateTime,self.delFlag];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from rStatus where rStatusId = '%@' and uid = '%@'",self.rStatusId,self.uid];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

+ (NSMutableArray *)readTableWithDeviceId:(NSString *)deviceId{
    NSMutableArray *array = [NSMutableArray new];
    NSString *sql = [NSString stringWithFormat:@"select * from rStatus where uid = '%@' and deviceId = '%@' and delFlag = 0 order by updateTime asc",UID(),deviceId];
    queryDatabase(sql, ^(FMResultSet *rs) {
        HMrStatusModel *model = [HMrStatusModel object:rs];
        [array addObject:model];
    });
    return array;
}

@end
