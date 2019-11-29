//
//  ClotheshorseCutdown.m
//  HomeMate
//
//  Created by Air on 15/11/18.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "HMClotheshorseCutdown.h"

@implementation HMClotheshorseCutdown

+(NSString *)tableName
{
    return @"clotheshorseCutdown";
}
+ (BOOL)createTable
{
    
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists  clotheshorseCutdown ("
                   "clotheshorseCutdownId INTEGER PRIMARY KEY ASC ON CONFLICT REPLACE AUTOINCREMENT UNIQUE ON CONFLICT REPLACE,"
                   "uid text UNIQUE ON CONFLICT REPLACE,"
                   "deviceId text UNIQUE ON CONFLICT REPLACE,"
                   "lightingTime INTEGER,"
                   "sterilizingTime INTEGER,"
                   "heatDryingTime INTEGER,"
                   "windDryingTime INTEGER"
                   ")"];
    return result;
}

- (BOOL)insertObject
{
    NSString * sql = [NSString stringWithFormat:@"insert into clotheshorseCutdown (uid,deviceId,lightingTime,sterilizingTime,heatDryingTime,windDryingTime) "
                      "values('%@','%@',%ld,%ld,%ld,%ld)",self.uid,self.deviceId,self.lightingTime,self.sterilizingTime,self.heatDryingTime,self.windDryingTime];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
    
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from clotheshorseCutdown where deviceId = '%@'",self.deviceId];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

+ (HMClotheshorseCutdown *)objectWithDeviceId:(NSString *)deviceId
{
    NSString *sql = [NSString stringWithFormat:@"select * from clotheshorseCutdown where deviceId = '%@'",deviceId];
    __block HMClotheshorseCutdown *chCutDown = nil;
    queryDatabase(sql, ^(FMResultSet *rs) {
        chCutDown = [HMClotheshorseCutdown object:rs];
    });
    return chCutDown;
}

+ (void)updateObjWithDeviceId:(NSString *)deviceId countDownTime:(NSInteger)cdTime countDownType:(KCountDownTimeType)cdType
{
    NSMutableString *sql = [NSMutableString stringWithString:@"update clotheshorseCutdown set "];
    switch (cdType) {
        case KCountDownTimeAirDry:
            [sql appendFormat:@"windDryingTime = '%ld' ",cdTime];
            break;
        case KCountDownTimeHeatDry:
            [sql appendFormat:@"heatDryingTime = '%ld' ",cdTime];
            break;
        case KCountDownTimeSterilize:
            [sql appendFormat:@"sterilizingTime = '%ld' ",cdTime];
            break;
        case KCountDownTimeLight:
            [sql appendFormat:@"lightingTime = '%ld' ",cdTime];
            break;
            
        default:
            break;
    }
    [sql appendFormat:@"where deviceId = '%@'",deviceId];
    [[HMDatabaseManager shareDatabase] executeUpdate:sql];
}



@end
