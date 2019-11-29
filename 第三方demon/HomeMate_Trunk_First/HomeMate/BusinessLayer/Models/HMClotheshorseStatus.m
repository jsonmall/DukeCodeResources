//
//  ClotheshorseStatus.m
//  HomeMate
//
//  Created by Air on 15/11/18.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "HMClotheshorseStatus.h"

@implementation HMClotheshorseStatus

+(NSString *)tableName
{
    return @"clotheshorseStatus";
}
+ (BOOL)createTable
{
    
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists clotheshorseStatus ("
                   "clotheshorseStatusId INTEGER PRIMARY KEY ASC ON CONFLICT REPLACE AUTOINCREMENT UNIQUE ON CONFLICT REPLACE,"
                   "uid text UNIQUE ON CONFLICT REPLACE,"
                   "deviceId text UNIQUE ON CONFLICT REPLACE,"
                   "motorState text,"
                   "motorStateTime text,"
                   "motorPosition INTEGER,"
                   "motorPositionTime text,"
                   "lightingState text,"
                   "lightingStateTime text,"
                   "sterilizingState text,"
                   "sterilizingStateTime text,"
                   "heatDryingState text,"
                   "heatDryingStateTime text,"
                   "windDryingState text,"
                   "windDryingStateTime text,"
                   "mainSwitchState text,"
                   "mainSwitchStateTime text,"
                   "exceptionInfo text,"
                   "exceptionInfoTime text)"];
    
    return result;
}

- (BOOL)insertObject
{
    NSString * sql = [NSString stringWithFormat:@"insert into clotheshorseStatus (uid,deviceId,motorState,motorStateTime,motorPosition,motorPositionTime,lightingState,lightingStateTime,sterilizingState,sterilizingStateTime,heatDryingState,heatDryingStateTime,windDryingState,windDryingStateTime,mainSwitchState,mainSwitchStateTime,exceptionInfo,exceptionInfoTime) "
                      "values('%@','%@','%@','%@','%ld','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')",self.uid,self.deviceId,self.motorState,self.motorStateTime,self.motorPosition,self.motorPositionTime,self.lightingState,self.lightingStateTime,self.sterilizingState,self.sterilizingStateTime,self.heatDryingState,self.heatDryingStateTime,self.windDryingState,self.windDryingStateTime,self.mainSwitchState,self.mainSwitchStateTime,self.exceptionInfo,self.exceptionInfoTime];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
    
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from clotheshorseStatus where deviceId = '%@'",self.deviceId];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

+ (HMClotheshorseStatus *)objectWithDeviceId:(NSString *)deviceId
{
    NSString *sql = [NSString stringWithFormat:@"select * from clotheshorseStatus where deviceId = '%@'",deviceId];
    __block HMClotheshorseStatus *chStatus = nil;
    queryDatabase(sql, ^(FMResultSet *rs) {
        chStatus = [HMClotheshorseStatus object:rs];
    });
    return chStatus;
}

+ (BOOL)updateStatusType:(KStatusType)type ctrlTime:(NSString *)ctrlTime status:(int)status deviceId:(NSString *)deviceId
{
    NSString *sql = nil;
    NSString *order = (status == 1) ? @"on" : @"off";
    switch (type) {
        case KStatusTypeWindDry:
            sql = [NSString stringWithFormat:@"update clotheshorseStatus set windDryingState = '%@',windDryingStateTime = '%@' where deviceId = '%@'",order,ctrlTime,deviceId];
            break;
        case KStatusTypeHeatDry:
            sql = [NSString stringWithFormat:@"update clotheshorseStatus set heatDryingState = '%@',heatDryingStateTime = '%@' where deviceId = '%@'",order,ctrlTime,deviceId];
            break;
        case KStatusTypeLight:
            sql = [NSString stringWithFormat:@"update clotheshorseStatus set lightingState = '%@',lightingStateTime = '%@' where deviceId = '%@'",order,ctrlTime,deviceId];
            break;
        case KStatusTypeSterilize:
            sql = [NSString stringWithFormat:@"update clotheshorseStatus set sterilizingState = '%@',sterilizingStateTime = '%@' where deviceId = '%@'",order,ctrlTime,deviceId];
            break;
        case KStatusTypeMainCtrl:
            sql = [NSString stringWithFormat:@"update clotheshorseStatus set mainSwitchState = '%@',mainSwitchStateTime = '%@' where deviceId = '%@'",order,ctrlTime,deviceId];
            break;
        default:
            break;
    }
    
    return [[HMDatabaseManager shareDatabase] executeUpdate:sql];
}



@end
