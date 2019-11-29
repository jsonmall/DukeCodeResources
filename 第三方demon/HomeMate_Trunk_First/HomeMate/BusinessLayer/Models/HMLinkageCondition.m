//
//  VihmeLinkageCondition.m
//  HomeMate
//
//  Created by Air on 15/8/17.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "HMLinkageCondition.h"

@implementation HMLinkageCondition


+(NSString *)tableName
{
    return @"linkageCondition";
}
+ (BOOL)createTable
{
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists linkageCondition "
                   "(linkageConditionId text,"
                   "uid text,"
                   "linkageId text,"
                   "linkageType integer,"
                   "condition integer,"
                   "deviceId text,"
                   "statusType integer,"
                   "value integer,"
                   "createTime text,"
                   "updateTime text,"
                   "delFlag integer,"
                   "UNIQUE (linkageConditionId, uid) ON CONFLICT REPLACE)"];
    return result;
}

- (BOOL)insertObject
{
    if (!self.createTime) {
        self.createTime = self.updateTime;
    }
    
    NSString * sql = [NSString stringWithFormat:@"insert into linkageCondition (linkageConditionId,uid,linkageId,linkageType,condition,deviceId,statusType,value,createTime,updateTime,delFlag) values('%@','%@','%@',%d,%d,'%@',%d,%d,'%@','%@',%d)",self.linkageConditionId,self.uid,self.linkageId,self.linkageType,self.condition,self.deviceId,self.statusType,self.value,self.createTime,self.updateTime,self.delFlag];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from linkageCondition where linkageConditionId = '%@' and uid = '%@'",self.linkageConditionId,self.uid];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

- (id)copyWithZone:(NSZone *)zone
{
    HMLinkageCondition *copySelf = [[HMLinkageCondition alloc]init];
    copySelf.linkageConditionId = self.linkageConditionId;
    copySelf.uid = self.uid;
    copySelf.linkageId = self.linkageId;
    copySelf.linkageType = self.linkageType;
    copySelf.condition = self.condition;
    copySelf.deviceId = self.deviceId;
    copySelf.statusType = self.statusType;
    copySelf.value = self.value;
    
    return copySelf;
}
- (NSDictionary *)dictionaryFromObject
{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    return dic;
}

+(HMLinkageCondition *)linkageDeviceWithlinkageId:(NSString *)linkageId
{
    NSString *sql = [NSString stringWithFormat:@"select * from linkageCondition where linkageId = '%@' and uid = '%@' and linkageType = 0 and delFlag = 0",linkageId,UID()];
    FMResultSet *resultSet = [[HMDatabaseManager shareDatabase] executeQuery:sql];
    HMLinkageCondition *linkageCondition;
    if ([resultSet next]) {
        linkageCondition = [HMLinkageCondition object:resultSet];
    }
    [resultSet close];
    return linkageCondition;
}

+ (NSArray *)securityDeviceArrayWithSecurityId:(NSString *)securityId
{
    NSString *sql = [NSString stringWithFormat:@"select * from linkageCondition where linkageId = '%@' and uid = '%@' and linkageType = 0 and delFlag = 0",securityId,UID()];
    __block NSMutableArray *securityConditionArray;
    queryDatabase(sql, ^(FMResultSet *rs) {
        if (!securityConditionArray) {
            securityConditionArray = [[NSMutableArray alloc] init];
        }
        HMLinkageCondition *linkageCondition = [HMLinkageCondition object:rs];
        [securityConditionArray addObject:linkageCondition];
    });
    return securityConditionArray;
}

+ (NSArray *)deviceIdArrayWithSecurityId:(NSString *)securityId
{
    NSString *sql = [NSString stringWithFormat:@"select deviceId from linkageCondition where linkageId = '%@' and delFlag = 0 group by deviceId",securityId];
    __block NSMutableArray *deviceIdArray;
    queryDatabase(sql, ^(FMResultSet *rs) {
        if (!deviceIdArray) {
            deviceIdArray = [[NSMutableArray alloc] init];
        }
        [deviceIdArray addObject:[rs stringForColumn:@"deviceId"]];
    });
    return deviceIdArray;
}



@end


