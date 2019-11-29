//
//  VihomeAuthority.m
//  Vihome
//
//  Created by Ned on 1/16/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "HMAuthority.h"

@implementation HMAuthority
+(NSString *)tableName
{
    return @"authority";
}
+ (BOOL)createTable
{
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists authority "
                   "(authorityId text UNIQUE ON CONFLICT REPLACE,"
                   "userId text,"
                   "authorityLever integer,"
                   "authorityType integer,"
                   "roomNo text,"
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
    
    NSString * sql = [NSString stringWithFormat:@"insert into authority (authorityId,userId,authorityLever,authorityType,roomNo,createTime,updateTime,delFlag) values('%@','%@',%d,%d,'%@','%@','%@',%d)",self.authorityId ,self.userId,self.authorityLever,self.authorityType,self.roomNo,self.createTime,self.updateTime,self.delFlag];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from authority where authorityId = '%@'",self.authorityId];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

- (NSDictionary *)dictionaryFromObject
{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    return dic;
}


@end
