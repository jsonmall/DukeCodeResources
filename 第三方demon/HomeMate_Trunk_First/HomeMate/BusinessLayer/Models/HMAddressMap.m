//
//  VihomeAddressMap.m
//  Vihome
//
//  Created by Ned on 1/16/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "HMAddressMap.h"

@implementation HMAddressMap

+(NSString *)tableName
{
    return @"addressMap";
}
+ (BOOL)createTable
{
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists addressMap "
                   "(addressMapId integer,"
                   "uid TEXT,"
                   "nwkAddr TEXT,"
                   "extAddr TEXT,"
                   "capabilities integer,"
                   "offline integer,"
                   "UNIQUE (addressMapId, uid) ON CONFLICT REPLACE)"];
    return result;
}

- (BOOL)insertObject
{
    NSString * sql = [NSString stringWithFormat:@"insert into addressMap (addressMapId,uid,nwkAddr,extAddr,capabilities,offline) values(%d, '%@','%@','%@',%d,%d)",self.addressMapId,self.uid,self.nwkAddr,self.extAddr,self.capabilities,self.offline];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from addressMap where addressMapId = %d and uid = '%@'",self.addressMapId,self.uid];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

@end
