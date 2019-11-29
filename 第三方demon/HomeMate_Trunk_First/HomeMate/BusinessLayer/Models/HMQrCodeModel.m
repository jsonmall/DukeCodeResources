//
//  QrCodeModel.m
//  HomeMate
//
//  Created by liuzhicai on 16/1/13.
//  Copyright © 2016年 Air. All rights reserved.
//

#import "HMQrCodeModel.h"
#import "HMLocalDbManager.h"

@implementation HMQrCodeModel
+(NSString *)tableName
{
    return @"qrCode";
}
+ (BOOL)createTable
{
    BOOL result = [[HMLocalDbManager shareDatabase] executeUpdateSql:@"CREATE TABLE if not exists qrCode "
                   "(qrCodeId text UNIQUE ON CONFLICT REPLACE,"
                   "qrCodeNo integer,"
                   "type text,"
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
    
    NSString * sql = [NSString stringWithFormat:@"insert into qrCode (qrCodeId,qrCodeNo,type,picUrl,createTime,updateTime,delFlag) values('%@', %d,'%@','%@','%@','%@',%d)",self.qrCodeId,self.qrCodeNo,self.type,self.picUrl,self.createTime,self.updateTime,self.delFlag];
    BOOL result = [[HMLocalDbManager shareDatabase] executeUpdateSql:sql];
    return result;
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from qrCode where qrCodeId = '%@'",self.qrCodeId];
    BOOL result =  [[HMLocalDbManager shareDatabase] executeUpdateSql:sql];
    return result;
}

+ (instancetype)objectwithQrCode:(NSString *)qrCodeNo
{
    NSString *sql = [NSString stringWithFormat:@"select * from qrCode where qrCodeNo = '%@' and delFlag = 0",qrCodeNo];
    HMQrCodeModel *qrCodeModel = nil;
    FMResultSet *set = [[HMLocalDbManager shareDatabase] executeQuery:sql];
    if ([set next]) {
        qrCodeModel = [[self class] objectWithKeyValues:[set resultDictionary]];
    }
    return qrCodeModel;
}

+ (instancetype)objectFromDictionary:(NSDictionary *)dict
{
    HMQrCodeModel *obj = [[self class] objectWithKeyValues:dict];
    return obj;
}

@end
