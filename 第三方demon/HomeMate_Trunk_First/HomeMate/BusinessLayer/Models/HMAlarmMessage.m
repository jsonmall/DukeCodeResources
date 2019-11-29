//
//  VihomeAlarmMessage.m
//  Vihome
//
//  Created by Ned on 1/16/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "HMAlarmMessage.h"

@implementation HMAlarmMessage

+(NSString *)tableName
{
    return @"alarmMessage";
}

+ (BOOL)createTable
{
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists alarmMessage "
                   "(messageId text,"
                   "uid text,"
                   "deviceId integer,"
                   "type integer,"
                   "time integer,"
                   "message text,"
                   "readType integer,"
                   "disarmFlag integer,"
                   "createTime text,"
                   "updateTime text,"
                   "delFlag integer,"
                   "UNIQUE (messageId, uid) ON CONFLICT REPLACE)"];
    return result;
}

- (BOOL)insertObject
{
    if (!self.createTime) {
        self.createTime = self.updateTime;
    }
    
    NSString * sql = [NSString stringWithFormat:@"insert into alarmMessage (messageId,deviceId,uid,type,time,message,readType,disarmFlag,createTime,updateTime,delFlag) values('%@','%@','%@',%d,%d,'%@',%d,%d,'%@','%@',%d)",self.messageId,self.deviceId,self.uid,self.type,self.time,self.message,self.readType,self.disarmFlag,self.createTime,self.updateTime,self.delFlag];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from alarmMessage where messageId = '%@' and uid = '%@'",self.messageId,self.uid];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}


- (NSDictionary *)dictionaryFromObject
{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    return dic;
}

@end
