//
//  HMmStatusModel.m
//  HomeMate
//
//  Created by Air on 16/3/2.
//  Copyright © 2016年 Air. All rights reserved.
//

#import "HMmStatusModel.h"

@implementation HMmStatusModel
+(NSString *)tableName
{
    return @"mStatus";
}
+ (BOOL)createTable
{
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists mStatus ("
                   "mStatusId text,"
                   "uid text,"
                   "deviceId text,"
                   "value1 integer,"
                   "value2 integer,"
                   "value3 integer,"
                   "value4 integer,"
                   "month TEXT,"
                   "createTime TEXT,"
                   "updateTime TEXT,"
                   "delFlag integer,"
                   "UNIQUE (mStatusId, uid) ON CONFLICT REPLACE)"];
    return result;
}


- (BOOL)insertObject
{
    
    NSString * sql = [NSString stringWithFormat:@"insert into mStatus (mStatusId,uid,deviceId,value1,value2,value3,value4,month,createTime,updateTime,delFlag) values('%@','%@','%@',%d,%d,%d,%d,'%@','%@','%@',%d)",self.mStatusId,self.uid,self.deviceId,self.value1,self.value2,self.value3,self.value4,self.month,self.createTime,self.updateTime,self.delFlag];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from mStatus where mStatusId = '%@' and uid = '%@'",self.mStatusId,self.uid];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

@end
