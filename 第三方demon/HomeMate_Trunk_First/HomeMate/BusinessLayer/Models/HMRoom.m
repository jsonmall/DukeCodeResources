//
//  VihomeRoom.m
//  Vihome
//
//  Created by Ned on 1/16/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "HMRoom.h"

@implementation HMRoom
+(NSString *)tableName
{
    return @"room";
}
+ (BOOL)createTable
{
    //primary key (UID,roomID)
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists room "
                   "(roomId text,"
                   "uid text,"
                   "roomName text,"
                   "floorId text,"
                   "roomType integer,"
                   "createTime text,"
                   "updateTime text,"
                   "delFlag integer,"
                   "UNIQUE (roomId, uid) ON CONFLICT REPLACE)"];
    return result;
}

- (BOOL)insertObject
{
    if (!self.createTime) {
        self.createTime = self.updateTime;
    }
    
    NSString * sql = [NSString stringWithFormat:@"insert into room (roomId,uid,roomName,floorId,roomType,createTime,updateTime,delFlag) values('%@','%@','%@','%@',%d,'%@','%@',%d)",self.roomId,self.uid,self.roomName,self.floorId,self.roomType,self.createTime,self.updateTime,self.delFlag];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    
    #warning 此处可以创建trigger
    
    NSString * sql = [NSString stringWithFormat:@"delete from room where roomId = '%@' and uid = '%@'",self.roomId,self.uid];
    [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    
    
    //删除房间同时需要将该房间里的设备设备roomID置0
    sql = [NSString stringWithFormat:@"update device set roomId = '%@' where roomId = '%@' and uid = '%@'",@"",self.roomId,self.uid];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}


- (NSDictionary *)dictionaryFromObject
{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    return dic;
}

+ (instancetype)objectFromUID:(NSString *)UID recordID:(NSString *)recordID
{
    NSString * selectSQL = [NSString stringWithFormat:@"select * from room where roomId = '%@' and uid = '%@' and delFlag = 0",recordID,UID];
    FMResultSet * sets = [[HMDatabaseManager shareDatabase] executeQuery:selectSQL];
    while ([sets next]) {
        
        HMRoom *room = [[self class] object:sets];
        [sets close];
        return room;
    }
    [sets close];
    return nil;
}

- (id)copyWithZone:(NSZone *)zone
{
    HMRoom *object = [[HMRoom alloc]init];
    
    object.roomId = self.roomId;
    object.uid = self.uid;
    object.floorId = self.floorId;
    object.roomName = self.roomName;
    
    return object;
}

-(BOOL)hasDevice
{
    NSString * selectSQL = [NSString stringWithFormat:@"select count() as count from device where roomId = '%@' and uid = '%@' and delFlag = 0",self.roomId,self.uid];
    FMResultSet * sets = [[HMDatabaseManager shareDatabase] executeQuery:selectSQL];
    while ([sets next]) {
        
        int count = [sets intForColumn:@"count"];
        
        [sets close];
        return count > 0;
    }
    [sets close];
    return NO;
}

-(BOOL)isValidRoom
{
    // 如果房间存在并且房间里面有设备，则认为这个房间有效
    HMRoom *room = [[self class]objectFromUID:self.uid recordID:self.roomId];
    if (room && room.hasDevice) {
        return YES;
    }
    return NO;
}

@end
