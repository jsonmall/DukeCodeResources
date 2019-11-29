//
//  CommonDeviceModel.m
//  
//
//  Created by Air on 15/12/4.
//
//

#import "HMCommonDeviceModel.h"

@implementation HMCommonDeviceModel

+(NSString *)tableName
{
    return @"deviceCommon";
}

+ (BOOL)createTable
{
    
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists deviceCommon ("
                   "deviceCommonId INTEGER PRIMARY KEY ASC ON CONFLICT REPLACE AUTOINCREMENT UNIQUE ON CONFLICT REPLACE,"
                   "deviceId text UNIQUE ON CONFLICT REPLACE,"
                   "commonFlag INTEGER)"];
    
    return result;
}

- (BOOL)insertObject
{
    NSString * sql = [NSString stringWithFormat:@"insert into deviceCommon (deviceId,commonFlag) "
                      "values('%@',%d)",self.deviceId,self.commonFlag];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
    
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from deviceCommon where deviceId = '%@'",self.deviceId];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}
@end
