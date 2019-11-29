//
//  LocalAccount.m
//  HomeMate
//
//  Created by Air on 15/8/11.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "HMLocalAccount.h"

@implementation HMLocalAccount

+(NSString *)tableName
{
    return @"localAccount";
}
+ (BOOL)createTable
{
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists localAccount("
                   "userId text PRIMARY KEY ON CONFLICT REPLACE,"
                   "loginTime INTEGER,"
                   "lastUserName text UNIQUE ON CONFLICT REPLACE,"
                   "password text"
                   ")"];
    return result;
}

- (BOOL)insertObject
{
    NSString *maxLoginTimeSql = @"select max(loginTime) from localAccount";
    __block int loginTime = 0;
    queryDatabase(maxLoginTimeSql, ^(FMResultSet *rs) {
        loginTime = [rs intForColumn:@"max(loginTime)"];
    });
    if (self.loginTime <= loginTime) {
        self.loginTime = loginTime + 1;
    }
    
    NSString * sql = [NSString stringWithFormat:@"insert into localAccount (userId,loginTime,lastUserName,password) "
                      "values('%@', %d,'%@','%@')",self.userId,self.loginTime,self.lastUserName,self.password];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
    
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from localAccount where userId = '%@'",self.userId];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    DLog(@"此属性未定义：%@",key);
}

+ (NSArray *)getAllLocalAccountArr
{
    NSMutableArray *arr;
    NSString *sql = [NSString stringWithFormat:@"select * from localAccount order by rowid desc"];
    FMResultSet *rs = [[HMDatabaseManager shareDatabase] executeQuery:sql];
    while ([rs next]) {
        if (!arr) {
            arr = [[NSMutableArray alloc] initWithCapacity:1];
        }
        HMLocalAccount *obj = [HMLocalAccount object:rs];
        [arr addObject:obj];
    }
    [rs close];
    return arr;
}

+ (HMLocalAccount *)lastAccountInfo
{
    NSString *sql = [NSString stringWithFormat:@"select * from localAccount where loginTime = (select max(loginTime) from localAccount)"];
    FMResultSet *resultSet = [[HMDatabaseManager shareDatabase] executeQuery:sql];
    HMLocalAccount *obj = nil;
    if ([resultSet next]) {
        obj = [HMLocalAccount object:resultSet];
    }
    
    [resultSet close];
    
    return obj;
}

+(BOOL)updateEmail:(NSString *)email
{
    HMLocalAccount *account = [HMLocalAccount lastAccountInfo];
    BOOL isUpdate = NO;
    if ([account.lastUserName rangeOfString:@"@"].location != NSNotFound) {
        isUpdate = YES;
    }
    if (isUpdate) {
        NSString *sql = [NSString stringWithFormat:@"update localAccount set lastUserName = '%@' where userId = '%@'",email,account.userId];
        BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
        return result;
    }
    return NO;
}

+(BOOL)updatePhone:(NSString *)phone
{
    HMLocalAccount *account = [HMLocalAccount lastAccountInfo];
    BOOL isUpdate = NO;
    if ([account.lastUserName rangeOfString:@"@"].location == NSNotFound) {
        isUpdate = YES;
    }
    if (isUpdate) {
        NSString *sql = [NSString stringWithFormat:@"update localAccount set lastUserName = '%@' where userId = '%@'",phone,account.userId];
        BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
        return result;
    }
    return NO;
}

+(BOOL)updatePassword:(NSString *)password
{
    NSString *userId = userAccout().userId;
    NSString *sql = [NSString stringWithFormat:@"update localAccount set password = '%@' where userId = '%@'",password,userId];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

@end





