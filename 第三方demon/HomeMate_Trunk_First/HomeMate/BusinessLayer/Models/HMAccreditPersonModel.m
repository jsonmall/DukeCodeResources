//
//  HMAccreditPersonModel.m
//  HomeMate
//
//  Created by orvibo on 15/12/10.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "HMAccreditPersonModel.h"

@implementation HMAccreditPersonModel
+(NSString *)tableName
{
    return @"recentVisitRecord";
}
+ (BOOL)createTable
{
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists recentVisitRecord("
                   "recentVisitId Integer primary key autoincrement,"
                   "name text,"
                   "uid text,"
                   "time text,"
                   "createTime text,"
                   "updateTime text,"
                   "deviceId text,"
                   "phone text,"
                   "UNIQUE (uid, phone) ON CONFLICT REPLACE)"];
    return result;
}

- (BOOL)insertObject
{
    NSString * sql = [NSString stringWithFormat:@"insert into recentVisitRecord (name,uid,time,createTime,updateTime,deviceId,phone) values('%@', '%@','%@','%@' ,'%@', '%@', '%@')",self.name,self.uid,self.time,self.createTime,self.updateTime,self.deviceId,self.phone];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
    
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from recentVisitRecord where phone  = '%@'",self.phone];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

+(NSMutableArray *)selectAllWith:(NSString *)deviceID{
    NSMutableArray *arr = [NSMutableArray new];
    __block NSInteger i=0;
    NSString *sql = [NSString stringWithFormat:@"select * from recentVisitRecord where uid = '%@' and deviceId = '%@' order by updateTime desc",UID(),deviceID];
    
    queryDatabase(sql, ^(FMResultSet *rs) {
        i++;
        HMAccreditPersonModel *model = [HMAccreditPersonModel object:rs];
        if (i<4) {
            [arr addObject:model];
        }else{
            [model deleteObject];
        }
        
    });

    return arr;
}

@end
