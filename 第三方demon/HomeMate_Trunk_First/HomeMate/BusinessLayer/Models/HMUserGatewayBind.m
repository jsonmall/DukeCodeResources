//
//  VihomeUserGatewayBind.m
//  Vihome
//
//  Created by Air on 15/7/24.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "HMUserGatewayBind.h"

@implementation HMUserGatewayBind

+(NSString *)tableName
{
    return @"userGatewayBind";
}
+ (BOOL)createTable
{
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists userGatewayBind "
                   "(bindId text,"
                   "userId text,"
                   "uid text,"
                   "userType integer,"
                   "createTime text,"
                   "updateTime text,"
                   "delFlag integer,"
                   "UNIQUE (userId, uid) ON CONFLICT REPLACE)"];
    return result;
}

- (BOOL)insertObject
{
    if (!self.createTime) {
        self.createTime = self.updateTime;
    }
    
    NSString * sql = [NSString stringWithFormat:@"insert into userGatewayBind (bindId,userId,uid,userType,createTime,updateTime,delFlag) values('%@','%@','%@',%d,'%@','%@', %d)",self.bindId,self.userId,self.uid,self.userType,self.createTime,self.updateTime,self.delFlag];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
    
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from userGatewayBind where bindId = '%@' and uid = '%@'",self.bindId,self.uid];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

- (NSDictionary *)dictionaryFromObject
{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    
    [dic setObject:self.bindId forKey:@"bindId"];
    [dic setObject:self.userId forKey:@"userId"];
    [dic setObject:self.uid forKey:@"uid"];
    [dic setObject:[NSNumber numberWithInt:self.userType] forKey:@"userType"];
    [dic setObject:self.updateTime forKey:@"updateTime"];
    [dic setObject:[NSNumber numberWithInt:self.delFlag] forKey:@"delFlag"];
    
    return dic;
}

+(NSArray *)bindArrWithUserType:(int)userType
{
    NSString *sql = [NSString stringWithFormat:@"select * from userGatewayBind where userId = '%@' and userType = %d and delFlag = 0",userAccout().userId,userType];
    FMResultSet *rs = [[HMDatabaseManager shareDatabase] executeQuery:sql];
    NSMutableArray *arr = nil;
    while ([rs next]) {
        if (!arr) {
            arr = [[NSMutableArray alloc] init];
        }
        [arr addObject:[HMUserGatewayBind object:rs]];
    }
    [rs close];
    return arr;
}

+(BOOL)hasBindUserType:(int)userType model:(NSString *)model uid:(NSString *)cocoUid
{
    NSArray *bindArr = [[self class] bindArrWithUserType:userType];
    BOOL exist = NO;
    if (bindArr != nil) {
        for (HMUserGatewayBind *obj in bindArr) {
            NSString *uid = obj.uid;
            NSString *sql = [NSString stringWithFormat:@"select * from gateway where uid = '%@' and (model like '%%%@%%' or model like '%%%@%%' or model like '%%%@%%')",uid,model,kS20Model,kHudingStripModel];
            FMResultSet *rs = [[HMDatabaseManager shareDatabase] executeQuery:sql];
            if ([rs next]) {
                if (cocoUid) {
                    if ([uid isEqualToString:cocoUid]) {
                        exist = YES;
                        break;
                    }
                }else{
                    exist = YES;
                }
            }
            [rs close];
            if (exist) {
                break;
            }
        }
    }
    return exist;
}

+(BOOL)hasBindCOCOUserType:(int)userType
{
    return [[self class] hasBindUserType:userType model:kCocoModel uid:nil];
}

+(BOOL)hasBindCOCOWithUid:(NSString *)uid UserType:(int)userType
{
    return [[self class] hasBindUserType:userType model:kCocoModel uid:uid];
}


@end
