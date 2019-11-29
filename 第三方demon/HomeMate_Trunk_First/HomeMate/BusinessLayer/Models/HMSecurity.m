//
//  HMSecurity.m
//  HomeMate
//
//  Created by orvibo on 16/3/4.
//  Copyright © 2016年 Air. All rights reserved.
//

#import "HMSecurity.h"

@implementation HMSecurity

+(NSString *)tableName
{
    return @"security";
}

+(BOOL)createTable
{
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"create table if not exists security \
                   (securityId text,\
                   name text,\
                   isArm integer,\
                   type integer,\
                   secType integer,\
                   uid text,\
                   createTime text,\
                   updateTime text,\
                   delFlag integer,\
                   unique (securityId, uid) on conflict replace)"];
    
    return result;
}

-(BOOL)insertObject
{
    NSString *sql = [NSString stringWithFormat:@"insert into security \
                     (securityId, name, isArm, type, secType, uid, createTime, updateTime, delFlag) values \
                     ('%@','%@',%d,%d,%d,'%@','%@','%@',%d)",
                     self.securityId, self.name, self.isArm, self.type, self.secType, self.uid, self.createTime, self.updateTime, self.delFlag];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

-(BOOL)updateObject
{
    return [self insertObject];
}

-(id)copyWithZone:(NSZone *)zone
{
    HMSecurity *security = [[HMSecurity alloc] init];
    security.securityId = self.securityId;
    security.name = self.name;
    security.isArm = self.isArm;
    security.type = self.type;
    security.secType = self.secType;
    security.uid = self.uid;
    security.delFlag = self.delFlag;
    return security;
}


+(NSArray *)allSecurityArray
{
    NSString *uid = UID();
    __block NSMutableArray *securityArr;
//    NSString *sql = [NSString stringWithFormat:@"select s. * from security s, linkageCondition lc where s.delFlag = 0 and s.uid = '%@' and \
//                     (lc.linkageId = s.securityId and lc.linkageType = 0 and lc.delFlag = 0 and \
//                     lc.deviceId in (select deviceId from device where delFlag = 0 and uid = '%@'))",uid,uid];
    NSString *sql = [NSString stringWithFormat:@"select * from security where delFlag = 0 and uid = '%@' order by secType desc",uid];

    queryDatabase(sql, ^(FMResultSet *rs) {
        if (!securityArr) {
            securityArr = [[NSMutableArray alloc] init];
        }
        HMSecurity *security = [HMSecurity object:rs];
        [securityArr addObject:security];
    });
    return securityArr;
}

@end

