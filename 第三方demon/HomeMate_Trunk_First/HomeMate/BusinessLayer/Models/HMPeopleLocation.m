//
//  VihomePeopleLocation.m
//  Vihome
//
//  Created by Ned on 1/16/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "HMPeopleLocation.h"

@implementation HMPeopleLocation
+(NSString *)tableName
{
    return @"peopleLocation";
}
+ (BOOL)createTable
{
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists peopleLocation "
                   "(locationId text,"
                   "uid text,"
                   "roomId text,"
                   "peopleNum integer,"
                   "status integer,"
                   "createTime text,"
                   "updateTime text,"
                   "delFlag integer,"
                   "UNIQUE (locationId, uid) ON CONFLICT REPLACE)"];
    return result;
}

- (BOOL)insertObject
{
    if (!self.createTime) {
        self.createTime = self.updateTime;
    }
    
    NSString * sql = [NSString stringWithFormat:@"insert into peopleLocation (locationId,uid,roomId,peopleNum,status,createTime,updateTime,delFlag) values('%@','%@','%@',%d,%d,'%@','%@',%d)",self.locationId,self.uid,self.roomId,self.peopleNum,self.status,self.createTime,self.updateTime,self.delFlag];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from peopleLocation where locationId = '%@' and uid = '%@'",self.locationId,self.uid];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}


- (NSDictionary *)dictionaryFromObject
{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    
    [dic setObject:self.locationId forKey:@"locationId"];
    [dic setObject:self.uid forKey:@"uid"];
    [dic setObject:self.roomId forKey:@"roomId"];
    [dic setObject:[NSNumber numberWithInt:self.peopleNum] forKey:@"peopleNum"];
    [dic setObject:[NSNumber numberWithInt:self.status] forKey:@"status"];
    [dic setObject:self.updateTime forKey:@"updateTime"];
    [dic setObject:self.createTime forKey:@"createTime"];
    return dic;
}

@end
