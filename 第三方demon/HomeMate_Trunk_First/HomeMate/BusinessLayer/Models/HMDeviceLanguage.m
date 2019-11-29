//
//  DeviceLanguage.m
//  HomeMate
//
//  Created by liuzhicai on 16/1/13.
//  Copyright © 2016年 Air. All rights reserved.
//

#import "HMDeviceLanguage.h"
#import "HMLocalDbManager.h"

@implementation HMDeviceLanguage
+(NSString *)tableName
{
    return @"deviceLanguage";
}
+ (BOOL)createTable
{
    BOOL result = [[HMLocalDbManager shareDatabase] executeUpdateSql:@"CREATE TABLE if not exists deviceLanguage "
                   "(deviceLanguageId text UNIQUE ON CONFLICT REPLACE,"
                   "dataId text,"
                   "language integer,"
                   "productName integer,"
                   "manufacturer text,"
                   "stepInfo text,"
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
    
    NSString * sql = [NSString stringWithFormat:@"insert into deviceLanguage (deviceLanguageId,dataId,language,productName,manufacturer,stepInfo,createTime,updateTime,delFlag) values('%@','%@','%@','%@','%@','%@','%@','%@',%d)",self.deviceLanguageId,self.dataId,self.language,self.productName,self.manufacturer,self.stepInfo,self.createTime,self.updateTime,self.delFlag];
    BOOL result = [[HMLocalDbManager shareDatabase] executeUpdateSql:sql];
    return result;
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from deviceLanguage where deviceLanguageId = '%@'",self.deviceLanguageId];
    BOOL result =  [[HMLocalDbManager shareDatabase] executeUpdateSql:sql];
    return result;
}

+ (HMDeviceLanguage *)objectWithDataId:(NSString *)dataId
{
    return [self objectWithDataId:dataId sysLanguage:[RunTimeLanguage getCurrentLanguage]];
}

+ (NSString *)sqlWithDataId:(NSString *)dataId sysLanguage:(NSString *)sysLanguage
{
    return [NSString stringWithFormat:@"select * from deviceLanguage where dataId = '%@' and delFlag = 0 and language = '%@'",dataId,sysLanguage];
}

+ (HMDeviceLanguage *)objectWithDataId:(NSString *)dataId sysLanguage:(NSString *)sysLanguage
{
    NSString *sql = [self sqlWithDataId:dataId sysLanguage:sysLanguage];
    HMDeviceLanguage *model = nil;
    FMResultSet *set = [[HMLocalDbManager shareDatabase] executeQuery:sql];
    
    // 首先根据系统语言查询(如果地区性的语言包存在的话就以地区性的为准)
    if ([set next]) {
        model = [[self class] objectWithKeyValues:[set resultDictionary]];
    }
    
    // 不存在的话就以这种语言的通用语言为准 eg:fr-CA 不存在，则以 fr 去查
    if (!model && [sysLanguage rangeOfString:@"-"].location != NSNotFound) {
        
        sql = [self sqlWithDataId:dataId sysLanguage:[[sysLanguage componentsSeparatedByString:@"-"] firstObject]];
        set = [[HMLocalDbManager shareDatabase] executeQuery:sql];
        if ([set next]) {
            model = [[self class] objectWithKeyValues:[set resultDictionary]];
        }
    }
    
    // 都不存在，默认英文 （前提是系统语言非中文）
    if (!model && !CHinese) {
        
        sql = [self sqlWithDataId:dataId sysLanguage:@"en"];
        set = [[HMLocalDbManager shareDatabase] executeQuery:sql];
        if ([set next]) {
            model = [[self class] objectWithKeyValues:[set resultDictionary]];
        }
    }
    
    // 都不存在, 默认中文
    if (!model) {
        sql = [self sqlWithDataId:dataId sysLanguage:@"zh"];
        set = [[HMLocalDbManager shareDatabase] executeQuery:sql];
        if ([set next]) {
            model = [[self class] objectWithKeyValues:[set resultDictionary]];
        }

    }
    
    [set close];
    return model;

}

+ (instancetype)objectFromDictionary:(NSDictionary *)dict
{
    HMDeviceLanguage *obj = [[self class] objectWithKeyValues:dict];
    return obj;
}

//// 判断是否为繁体中文
//+ (BOOL)isHantsChinese
//{
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
//    NSString *currentLanguage = [languages firstObject];
//    if ([currentLanguage isEqualToString:@"zh-Hant"]   // 繁体中文
//        || [currentLanguage isEqualToString:@"zh-HK"]     // 繁体中文-香港
//        || [currentLanguage isEqualToString:@"zh-Hant-CN"]
//        || [currentLanguage rangeOfString:@"zh-Hant"].length > 0
//        ) {
//        return YES;
//    }else{
//        return NO;
//    }
//}

@end
