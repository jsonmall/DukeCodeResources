//
//  VihomeLinkage.m
//  Vihome
//
//  Created by Ned on 1/16/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "HMLinkage.h"

@implementation HMLinkage
+(NSString *)tableName
{
    return @"linkage";
}
+ (BOOL)createTable
{
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists linkage "
                   "(linkageId text,"
                   "uid text,"
                   "linkageName text,"
                   "isPause integer,"
                   "createTime text,"
                   "updateTime text,"
                   "delFlag integer,"
                   "UNIQUE (linkageId, uid) ON CONFLICT REPLACE)"];
    return result;
}

- (BOOL)insertObject
{
    if (!self.createTime) {
        self.createTime = self.updateTime;
    }
    
    NSString * sql = [NSString stringWithFormat:@"insert into linkage (linkageId,uid,linkageName,isPause,createTime,updateTime,delFlag) values('%@','%@','%@',%d,'%@','%@',%d)",self.linkageId,self.uid,self.linkageName,self.isPause,self.createTime,self.updateTime,self.delFlag];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    // 删除联动表
    NSString * deleLinkageSql = [NSString stringWithFormat:@"delete from linkage where linkageId = '%@' and uid = '%@'",self.linkageId,self.uid];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:deleLinkageSql];
    
    // 删除联动条件表
    NSString * deleLinkageConditionSql = [NSString stringWithFormat:@"delete from linkageCondition where linkageId = '%@' and uid = '%@'",self.linkageId,self.uid];
    result = [[HMDatabaseManager shareDatabase] executeUpdate:deleLinkageConditionSql];
    
    // 删除output表
    NSString * deleLinkageOutputSql = [NSString stringWithFormat:@"delete from linkageOutput where linkageId = '%@' and uid = '%@'",self.linkageId,self.uid];
    result = [[HMDatabaseManager shareDatabase] executeUpdate:deleLinkageOutputSql];
    
    
    return result;
}


+(void)deleteLinkageWithDeviceId:(NSString *)deviceId andUid:(NSString *)uid
{
    NSString *selectSql = [NSString stringWithFormat:@"select linkageId from linkageCondition where deviceId = '%@' and uid = '%@' and linkageType = 0",deviceId,uid];
    __block NSMutableArray *linkageIdArr;
    queryDatabase(selectSql, ^(FMResultSet *rs) {
        if (!linkageIdArr) {
            linkageIdArr = [[NSMutableArray alloc] initWithCapacity:1];
        }
        NSString *linkageId = [rs stringForColumn:@"linkageId"];
        [linkageIdArr addObject:linkageId];
    });
    for (NSString *liId in linkageIdArr) {
        
        // 删除联动表
        NSString * deleLinkageSql = [NSString stringWithFormat:@"delete from linkage where linkageId = '%@' and uid = '%@'",liId,uid];
        BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:deleLinkageSql];
        
        // 删除联动条件表
        NSString * deleLinkageConditionSql = [NSString stringWithFormat:@"delete from linkageCondition where linkageId = '%@' and uid = '%@'",liId,uid];
        result = [[HMDatabaseManager shareDatabase] executeUpdate:deleLinkageConditionSql];
        
        // 删除output表
        NSString * deleLinkageOutputSql = [NSString stringWithFormat:@"delete from linkageOutput where linkageId = '%@' and uid = '%@'",liId,uid];
        result = [[HMDatabaseManager shareDatabase] executeUpdate:deleLinkageOutputSql];
    }
}

- (id)copyWithZone:(NSZone *)zone
{
    HMLinkage *copySelf = [[HMLinkage alloc]init];
    copySelf.linkageId = self.linkageId;
    copySelf.uid = self.uid;
    copySelf.linkageName = self.linkageName;
    copySelf.isPause = self.isPause;

    return copySelf;
}
- (NSDictionary *)dictionaryFromObject
{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    return dic;
}

+(NSArray *)allLinkagesArr
{
    NSString *uid = UID();
    __block NSMutableArray *sceneArr;
    NSString *sql = [NSString stringWithFormat:@"select l.* from linkage l, linkageCondition lc where l.delFlag = 0 and l.uid = '%@' and (lc.linkageId = l.linkageId and lc.linkageType = 0 and lc.delFlag = 0 and lc.deviceId in (select deviceId from device where delFlag = 0 and uid = '%@'))",uid,uid];
    queryDatabase(sql, ^(FMResultSet *rs) {
        if (!sceneArr) {
            sceneArr = [[NSMutableArray alloc] init];
        }
        HMLinkage *scene = [HMLinkage object:rs];
        [sceneArr addObject:scene];
    });
    return sceneArr;
}

@end
