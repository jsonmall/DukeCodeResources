//
//  DBModel.m
//  Vihome
//
//  Created by Ned on 1/16/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "HMBaseModel.h"

@implementation HMBaseModel

+ (BOOL)createTable
{
    [NSException raise:@"异常信息" format:@"子类需要自己实现此方法"];
    return YES;
}
+ (BOOL)createTrigger
{
    DLog(@"调用了父类的方法创建触发器");
    return YES;
}
-(NSString *)UID
{
    return [self.uid lowercaseString];
}
- (BOOL)insertObject
{
    [NSException raise:@"异常信息" format:@"子类需要自己实现此方法"];
    return YES;
}

- (BOOL)updateObject
{
    [NSException raise:@"异常信息" format:@"子类需要自己实现此方法"];
    return YES;
}

- (BOOL)deleteObject
{
    [NSException raise:@"异常信息" format:@"子类需要自己实现此方法"];
    return YES;
}

+ (instancetype)object:(FMResultSet *)rs
{
    NSDictionary *dict = [rs resultDictionary];
    HMBaseModel *obj = [[self class] objectWithKeyValues:dict];
    return obj;
}

+ (instancetype)objectFromDictionary:(NSDictionary *)dict
{
    if ([dict.allKeys containsObject:@"order"]) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:dict];
        dic[@"bindOrder"] = dict[@"order"];
        
        HMBaseModel *obj = [[self class] objectWithKeyValues:dic];
        return obj;
    }
    
    HMBaseModel *obj = [[self class] objectWithKeyValues:dict];
    return obj;
}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"order"]) {
        [self setValue:value forKey:@"bindOrder"];
    }
    DLog(@"%s key : %@",__FUNCTION__,key);
}



+ (instancetype)objectFromUID:(NSString *)UID recordID:(NSString *)recordID
{
    return nil;
}

- (NSDictionary *)dictionaryFromObject
{
    return nil;
}

+(NSString *)tableName
{
    return nil;
}

-(sqlite3 *)sqlite {
    if (!_sqlite) {
        _sqlite = [[HMDatabaseManager shareDatabase].db sqliteHandle];
    }
    return _sqlite;
}
@end
