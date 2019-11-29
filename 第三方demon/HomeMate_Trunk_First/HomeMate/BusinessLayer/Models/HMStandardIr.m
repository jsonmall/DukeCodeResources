//
//  VihomeStandardIR.m
//  Vihome
//
//  Created by Ned on 1/16/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "HMStandardIr.h"

@implementation HMStandardIr
+(NSString *)tableName
{
    return @"standardIr";
}
+ (BOOL)createTable
{
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists standardIr "
                   "(standardIrId text,"
                   "uid text,"
                   "irDeviceId text,"
                   "bindOrder text,"
                   "ir text,"
                   "createTime text,"
                   "updateTime text,"
                   "delFlag integer,"
                   "UNIQUE (standardIrId, uid) ON CONFLICT REPLACE)"];
    return result;
}

- (BOOL)insertObject
{
    if (!self.createTime) {
        self.createTime = self.updateTime;
    }
    
    NSString * sql = [NSString stringWithFormat:@"insert into standardIr (standardIrId,uid,irDeviceId,bindOrder,ir,createTime,updateTime,delFlag) values('%@', '%@','%@','%@','%@','%@','%@',%d)",self.standardIrId,self.uid,self.irDeviceId,self.bindOrder,self.ir,self.createTime,self.updateTime,self.delFlag];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from standardIr where standardIrId = '%@' and uid = '%@'",self.standardIrId,self.uid];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}


- (NSDictionary *)dictionaryFromObject
{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    
    [dic setObject:self.standardIrId forKey:@"standardIrId"];
    [dic setObject:self.uid forKey:@"uid"];
    [dic setObject:self.irDeviceId forKey:@"irDeviceId"];
    [dic setObject:self.bindOrder forKey:@"order"];
    [dic setObject:self.ir forKey:@"ir"];
    [dic setObject:self.updateTime forKey:@"updateTime"];
    [dic setObject:[NSNumber numberWithInt:self.delFlag] forKey:@"delFlag"];
    
    return dic;
}

@end
