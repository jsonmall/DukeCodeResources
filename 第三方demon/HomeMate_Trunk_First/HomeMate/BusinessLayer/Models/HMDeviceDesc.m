//
//  DeviceDesc.m
//  HomeMate
//
//  Created by liuzhicai on 16/1/13.
//  Copyright © 2016年 Air. All rights reserved.
//

#import "HMDeviceDesc.h"
#import "HMLocalDbManager.h"
@implementation HMDeviceDesc
+(NSString *)tableName
{
    return @"deviceDesc";
}

+ (BOOL)createTable
{
    BOOL result = [[HMLocalDbManager shareDatabase] executeUpdateSql:@"CREATE TABLE if not exists deviceDesc "
                   "(deviceDescId text UNIQUE ON CONFLICT REPLACE,"
                   "model text,"
                   "productModel text,"
                   "endpointSet text,"
                   "picUrl text,"
                   "createTime text,"
                   "updateTime text,"
                   "delFlag integer)"];
    return result;
}

- (BOOL)insertObject
{
    if (!self.createTime) {
        self.createTime = self.updateTime;
    }
    
    NSString * sql = [NSString stringWithFormat:@"insert into deviceDesc (deviceDescId,model,productModel,endpointSet,picUrl,createTime,updateTime,delFlag) values('%@','%@','%@','%@','%@','%@','%@',%d)",self.deviceDescId,self.model,self.productModel,self.endpointSet,self.picUrl,self.createTime,self.updateTime,self.delFlag];
    BOOL result = [[HMLocalDbManager shareDatabase] executeUpdateSql:sql];
    return result;
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from deviceDesc where deviceDescId = '%@'",self.deviceDescId];
   BOOL result =  [[HMLocalDbManager shareDatabase] executeUpdateSql:sql];
   return result;
}

+ (instancetype)objectWithModel:(NSString *)model
{
    NSString *sql = [NSString stringWithFormat:@"select * from deviceDesc where model = '%@' and delFlag = 0",model];
    FMResultSet *set = [[HMLocalDbManager shareDatabase] executeQuery:sql];
    HMDeviceDesc *descModel = nil;
    if ([set next]) {
        descModel = [[self class] objectWithKeyValues:[set resultDictionary]];
    }
    
    return descModel;
}

+ (instancetype)objectFromDictionary:(NSDictionary *)dict
{
    HMDeviceDesc *obj = [[self class] objectWithKeyValues:dict];
    return obj;
}

@end
