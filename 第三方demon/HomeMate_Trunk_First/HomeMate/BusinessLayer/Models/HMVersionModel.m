//
//  VersionModel.m
//  HomeMate
//
//  Created by Air on 15/8/25.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "HMVersionModel.h"

@implementation HMVersionModel
+(NSString *)tableName
{
    return @"dbVersion";
}
+ (BOOL)createTable
{

    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists dbVersion("
                   "versionId INTEGER UNIQUE ON CONFLICT REPLACE DEFAULT 1,"
                   "dbVersion text)"];

    return result;
}

+ (BOOL)saveCurrentDbVersion
{
    NSString * sql = [NSString stringWithFormat:@"insert into dbVersion (dbVersion) "
                      "values('%@')",kDbVersion];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

+ (HMVersionModel *)oldVersion
{
    // 如果版本号表不存在，则返回当前最新版本
    if (![[[HMDatabaseManager shareDatabase]db]tableExists:[self tableName]]) {
        
        // 表不存在，则先创建表
        [[self class]createTable];
        
        HMVersionModel * ver = [[HMVersionModel alloc]init];
        ver.dbVersion = kDbVersion;
        [ver insertObject];
        
        return ver;
    }
    
    NSString * sql = [NSString stringWithFormat:@"select dbVersion from dbVersion where versionId = 1"];
    
    FMResultSet * rs = [[HMDatabaseManager shareDatabase]executeQuery:sql];
    if ([rs next]) {
        HMVersionModel *version = [HMVersionModel object:rs];
        [rs close];
        return version;
    }else{
        HMVersionModel * ver = [[HMVersionModel alloc]init];
        ver.dbVersion = kDbVersion;
        return ver;
    }
}

- (BOOL)insertObject
{
    NSString * sql = [NSString stringWithFormat:@"insert into dbVersion (versionId,dbVersion) "
                      "values(1,'%@')",self.dbVersion];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
    
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from dbVersion where dbVersion = '%@'",self.dbVersion];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}


@end
