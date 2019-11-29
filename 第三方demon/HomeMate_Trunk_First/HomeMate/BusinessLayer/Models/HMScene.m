//
//  VihomeScene.m
//  Vihome
//
//  Created by Ned on 1/16/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "HMScene.h"

@interface HMScene ()



@end

@implementation HMScene
+(NSString *)tableName
{
    return @"scene";
}
+ (BOOL)createTable
{
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists scene ""(sceneNo text,"
                   "uid text,"
                   "sceneName text,"
                   "roomId text,"
                   "onOffFlag integer,"
                   "sceneId integer,"
                   "groupId integer,"
                   "pic integer,"
                   "createTime text,"
                   "updateTime text,"
                   "delFlag integer,"
                   "UNIQUE (sceneNo, uid) ON CONFLICT REPLACE)"];
    return result;
}

- (BOOL)insertObject
{
    if (!self.createTime) {
        self.createTime = self.updateTime;
    }
    NSString * sql = [NSString stringWithFormat:@"insert into scene (sceneNo,uid,sceneName,roomId,onOffFlag,sceneId,groupId,pic,createTime,updateTime,delFlag) values('%@','%@','%@','%@',%d,%d,%d,%d,'%@','%@',%d)",self.sceneNo,self.uid,self.sceneName,self.roomId,self.onOffFlag,self.sceneId,self.groupId,self.pic,self.createTime,self.updateTime,self.delFlag];
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
    // 先删除绑定
    NSString * delBindSql = [NSString stringWithFormat:@"delete from sceneBind where sceneNo = '%@' and uid = '%@'",self.sceneNo,self.uid];
    updateInsertDatabase(delBindSql);
    
    // 删除情景本身
    NSString * sql = [NSString stringWithFormat:@"delete from scene where sceneId = %d and uid = '%@'",self.sceneId,self.uid];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}


- (NSDictionary *)dictionaryFromObject
{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    [dic setObject:self.sceneNo forKey:@"sceneNo"];
    [dic setObject:self.uid forKey:@"uid"];
    [dic setObject:self.sceneName forKey:@"sceneName"];
    [dic setObject:self.roomId forKey:@"roomId"];
    [dic setObject:[NSNumber numberWithInt:self.onOffFlag] forKey:@"onOffFlag"];
    [dic setObject:[NSNumber numberWithInt:self.sceneId] forKey:@"sceneId"];
    [dic setObject:[NSNumber numberWithInt:self.groupId] forKey:@"groupId"];
    [dic setObject:[NSNumber numberWithInt:self.pic] forKey:@"pic"];
    [dic setObject:self.updateTime forKey:@"updateTime"];
    [dic setObject:[NSNumber numberWithInt:self.delFlag] forKey:@"delFlag"];

    return dic;
}

- (id)copyWithZone:(NSZone *)zone
{
    HMScene *object = [[HMScene alloc]init];
    object.sceneNo = self.sceneNo;
    object.uid = self.uid;
    object.sceneName = self.sceneName;
    object.roomId = self.roomId;
    object.onOffFlag = self.onOffFlag;
    object.sceneId = self.sceneId;
    object.groupId = self.groupId;
    object.pic = self.pic;
    object.updateTime = self.updateTime;
    object.delFlag = self.delFlag;
    object.initialPic = self.pic;
    object.initialName = self.sceneName;
    return object;
}

-(BOOL)changed
{
    if ((![self.initialName isEqualToString:self.sceneName])       // 名称发生变化
        || (self.initialPic != self.pic)) {             // 图标发生变化
        return YES;
    }
    return NO;
}

+(NSArray *)allScenesArr
{
    // 0 调光灯 1 普通灯 2 插座 19 RGB灯 38 色温灯
    NSString *lightCountSql = [NSString stringWithFormat:@"select count() as count from device where delFlag = 0 and uid = '%@' and userId = '%@' and deviceType in (0,1,19,38)",UID(),userAccout().userId];
    __block int count = 0;
    queryDatabase(lightCountSql, ^(FMResultSet *rs) {
        count = [rs intForColumn:@"count"];
    });
    __block NSMutableArray *sceneArr;
    NSMutableString *sql = [NSMutableString string];
    if (count >= 3) {//当帐号下的zigbee灯光插座达到3个时才显示全开全关
        [sql appendFormat:@"select * from scene where delFlag = 0 and uid in (%@) order by case when onOffFlag in (1,0) then 1 else 0 end asc, sceneId asc",uids()];
    }else{
        [sql appendFormat:@"select * from scene where delFlag = 0 and uid in (%@) and onOffFlag not in (1,0) order by sceneId asc",uids()];
    }
    queryDatabase(sql, ^(FMResultSet *rs) {
        if (!sceneArr) {
            sceneArr = [[NSMutableArray alloc] init];
        }
        HMScene *scene = [HMScene object:rs];
        [sceneArr addObject:scene];
    });
    return sceneArr;
}




@end
