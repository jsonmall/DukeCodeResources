//
//  VihomeDeviceJoinIn.m
//  Vihome
//
//  Created by Ned on 1/16/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "HMDeviceJoinIn.h"

@implementation HMDeviceJoinIn
+(NSString *)tableName
{
    return @"deviceJoinIn";
}
+ (BOOL)createTable
{
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists deviceJoinIn "
                   "(joinInId text,"
                   "uid text,"
                   "extAddr text,"
                   "capabilities integer,"
                   "activeType integer,"
                   "endpointNum integer,"
                   "actualNum integer,"
                   "createTime text,"
                   "updateTime text,"
                   "delFlag integer,"
                   "UNIQUE (joinInId, uid) ON CONFLICT REPLACE)"];
    return result;
}

- (BOOL)insertObject
{
    if (!self.createTime) {
        self.createTime = self.updateTime;
    }
    
    NSString * sql = [NSString stringWithFormat:@"insert into deviceJoinIn (joinInId, uid,extAddr,capabilities,activeType,endpointNum,actualNum,createTime,updateTime,delFlag) values('%@', '%@','%@',%d,%d,%d,%d,'%@','%@',%d)",self.joinInId,self.uid,self.extAddr,self.capabilities,self.activeType,self.endpointNum,self.actualNum,self.createTime,self.updateTime,self.delFlag];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from deviceJoinIn where joinInId = '%@' and uid = '%@'",self.joinInId,self.uid];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

- (NSDictionary *)dictionaryFromObject
{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    return dic;
}


@end
