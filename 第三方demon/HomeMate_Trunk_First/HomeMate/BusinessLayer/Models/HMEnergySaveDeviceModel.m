//
//  EnergySaveDeviceModel.m
//  HomeMate
//
//  Created by liuzhicai on 15/12/22.
//  Copyright © 2015年 Air. All rights reserved.
//

#import "HMEnergySaveDeviceModel.h"

@implementation HMEnergySaveDeviceModel

+(NSString *)tableName
{
    return @"deviceEnergySave";
}

+ (BOOL)createTable
{
    
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists deviceEnergySave ("
                   "deviceEnergySaveId INTEGER PRIMARY KEY ASC ON CONFLICT REPLACE AUTOINCREMENT UNIQUE ON CONFLICT REPLACE,"
                   "deviceId text UNIQUE ON CONFLICT REPLACE,"
                   "energySaveFlag INTEGER)"];
    
    return result;
}

- (BOOL)insertObject
{
    NSString * sql = [NSString stringWithFormat:@"insert into deviceEnergySave (deviceId,energySaveFlag) "
                      "values('%@',%d)",self.deviceId,self.energySaveFlag];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
    
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from deviceEnergySave where deviceId = '%@'",self.deviceId];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}


@end
