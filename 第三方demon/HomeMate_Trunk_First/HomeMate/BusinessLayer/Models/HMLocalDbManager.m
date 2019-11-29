//
//  HMLocalDbManager.m
//  HomeMate
//
//  Created by liuzhicai on 16/1/18.
//  Copyright © 2016年 Air. All rights reserved.
//

#import "HMLocalDbManager.h"
#import "FMDatabase.h"

@interface HMLocalDbManager ()

@property (nonatomic, strong)FMDatabase *localDb;

@end

@implementation HMLocalDbManager

-(FMDatabase *)localDb
{
    if (!_localDb) {
        _localDb = [FMDatabase databaseWithPath:[kNEWDBDIR stringByAppendingPathComponent:@"city.db"]];
        DLog(@"%@",NSHomeDirectory());
        //打开数据库
        if (![_localDb open]) {
            DLog(@"数据库打开失败");
        }
    }
    return _localDb;
}

+ (HMLocalDbManager *)shareDatabase
{
    static HMLocalDbManager * shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[HMLocalDbManager alloc] init];
    });
    return shareInstance;
}



- (FMResultSet *)executeQuery:(NSString *)sql
{
    FMResultSet *set = [self.localDb executeQuery:sql];
    return set;
}

- (BOOL)executeUpdateSql:(NSString *)sql
{
   BOOL result = [self.localDb executeUpdate:sql];
   return result;
}

@end
