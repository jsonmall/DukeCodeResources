//
//  VihomeStandardIRDevice.m
//  Vihome
//
//  Created by Ned on 1/16/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "HMStandardIRDevice.h"

@implementation HMStandardIRDevice
+(NSString *)tableName
{
    return @"standardIrDevice";
}
+ (BOOL)createTable
{
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists standardIrDevice "
                   "(irDeviceId text,"
                   "uid text,"
                   "company text,"
                   "model text,"
                   "createTime text,"
                   "updateTime text,"
                   "delFlag integer,"
                   "UNIQUE (irDeviceId, uid) ON CONFLICT REPLACE)"];
    return result;
}

- (BOOL)insertObject
{
    if (!self.createTime) {
        self.createTime = self.updateTime;
    }
    
    NSString * sql = [NSString stringWithFormat:@"insert into standardIrDevice (irDeviceId,uid,company,model,createTime,updateTime,delFlag) values('%@', '%@','%@','%@','%@','%@',%d)",self.irDeviceId,self.uid,self.company,self.model,self.updateTime,self.createTime,self.delFlag];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from standardIrDevice where irDeviceId = '%@' and uid = '%@' and delFlag=0",self.irDeviceId,self.uid];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}


- (NSDictionary *)dictionaryFromObject
{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    [dic setObject:self.irDeviceId forKey:@"irDeviceId"];
    [dic setObject:self.uid forKey:@"uid"];
    [dic setObject:self.company forKey:@"company"];
    [dic setObject:self.model forKey:@"model"];
    [dic setObject:self.updateTime forKey:@"updateTime"];
    [dic setObject:self.createTime forKey:@"createTime"];
    [dic setObject:[NSNumber numberWithInt:self.delFlag] forKey:@"delFlag"];
    
    return dic;
}

@end
