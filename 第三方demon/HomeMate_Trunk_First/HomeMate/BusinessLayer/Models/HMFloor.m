//
//  VihomeFloor.m
//  Vihome
//
//  Created by Ned on 1/16/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "HMFloor.h"

@implementation HMFloor
+(NSString *)tableName
{
    return @"floor";
}
+ (BOOL)createTable
{
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists floor "
                   "(floorId text,"
                   "uid text,"
                   "floorName integer,"
                   "createTime text,"
                   "updateTime text,"
                   "delFlag integer,"
                   "UNIQUE (floorId, uid) ON CONFLICT REPLACE)"];
    return result;
}

- (BOOL)insertObject
{
    if (!self.createTime) {
        self.createTime = self.updateTime;
    }
    
    NSString * sql = [NSString stringWithFormat:@"insert into floor (floorId,uid,floorName,createTime,updateTime,delFlag) values('%@','%@','%@','%@','%@',%d)",self.floorId,self.uid,self.floorName,self.createTime,self.updateTime,self.delFlag];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    // 将房间里面的所有设备楼层信息置空
    
    NSString *sql = [NSString stringWithFormat:@"update device set roomId = '%@' where uid = '%@' and delFlag = 0 and roomId in "
                     "(select roomId from room where floorId = '%@' and uid = '%@' and delFlag = 0)",@"",self.uid,self.floorId,self.uid];
    updateInsertDatabase(sql);
    
#warning 此处可以创建trigger
    
    // 删除楼层
    NSString * deleteFloorSql = [NSString stringWithFormat:@"delete from floor where floorId = '%@' and uid = '%@' and delFlag = 0",self.floorId,self.uid];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:deleteFloorSql];
    
    // 删除房间
    NSString * deleteRoomsSql = [NSString stringWithFormat:@"delete from room where floorId = '%@' and uid = '%@' and delFlag = 0",self.floorId,self.uid];
    [[HMDatabaseManager shareDatabase] executeUpdate:deleteRoomsSql];
    
    
    return result;
}

- (NSDictionary *)dictionaryFromObject
{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    return dic;
}

+(void)saveFloorAndRoom:(NSDictionary *)dic
{
    NSString *uid = [dic objectForKey:@"uid"];
    
    // 保存楼层
    NSArray *floorArray = [dic objectForKey:@"floorList"];
    for (NSDictionary *floorDic in floorArray) {
        
        NSMutableDictionary *newDic = [NSMutableDictionary dictionaryWithDictionary:floorDic];
        [newDic setObject:uid forKey:@"uid"];
        HMFloor * object = [HMFloor objectFromDictionary:newDic];
        [object insertObject];
        
        // 保存房间
        
        NSArray *roomArray  = [floorDic objectForKey:@"roomList"];
        
        for (NSDictionary *roomDic in roomArray) {
            
            NSMutableDictionary *newDic = [NSMutableDictionary dictionaryWithDictionary:roomDic];
            [newDic setObject:uid forKey:@"uid"];
            HMRoom *room = [HMRoom objectFromDictionary:newDic];
            [room insertObject];
        }
    }
}

+ (instancetype)objectFromUID:(NSString *)UID recordID:(NSString *)recordID
{
    NSString * selectSQL = [NSString stringWithFormat:@"select * from floor where floorId = '%@' and uid = '%@'",recordID,UID];
    FMResultSet * sets = [[HMDatabaseManager shareDatabase] executeQuery:selectSQL];
    while ([sets next]) {
        
        HMFloor *fllor = [[self class] object:sets];
        
        [sets close];
        return fllor;
    }
    [sets close];
    return nil;
}

@end
