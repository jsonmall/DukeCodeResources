//
//  HMdStatusModel.m
//  HomeMate
//
//  Created by Air on 16/3/2.
//  Copyright © 2016年 Air. All rights reserved.
//

#import "HMdStatusModel.h"

@implementation HMdStatusModel
+(NSString *)tableName
{
    return @"dStatus";
}
+ (BOOL)createTable
{
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists dStatus ("
                   "dStatusId text,"
                   "uid text,"
                   "deviceId text,"
                   "value1 integer,"
                   "value2 integer,"
                   "value3 integer,"
                   "value4 integer,"
                   "date TEXT,"
                   "createTime TEXT,"
                   "updateTime TEXT,"
                   "delFlag integer,"
                   "UNIQUE (dStatusId, uid) ON CONFLICT REPLACE)"];
    return result;
}


- (BOOL)insertObject
{
    
    NSString * sql = [NSString stringWithFormat:@"insert into dStatus (dStatusId,uid,deviceId,value1,value2,value3,value4,date,createTime,updateTime,delFlag) values('%@','%@','%@',%d,%d,%d,%d,'%@','%@','%@',%d)",self.dStatusId,self.uid,self.deviceId,self.value1,self.value2,self.value3,self.value4,self.date,self.createTime,self.updateTime,self.delFlag];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from dStatus where dStatusId = '%@' and uid = '%@'",self.dStatusId,self.uid];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

@end
