//
//  BLDatabaseMgr.h
//  Vihome
//
//  Created by Ned on 1/16/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HMBaseModel.h"
#import "FMDatabaseAdditions.h"


typedef void(^FMBlock)(FMResultSet * rs);

typedef void(^FMSBlock)(FMResultSet * rs , BOOL *stop);

BOOL queryDatabase(NSString *sql , FMBlock queryBlock);
BOOL queryDatabaseStop(NSString *sql, FMSBlock stopBlock);
BOOL updateInsertDatabase(NSString *sql);

@interface HMDatabaseManager : NSObject

@property (nonatomic,retain) FMDatabase * db;

- (void)initDatabase;

+ (HMDatabaseManager *)shareDatabase;

- (FMResultSet *)executeQuery:(NSString *)sql;

- (BOOL)executeUpdate:(NSString *)sql;

- (NSMutableArray *)selectAllRecord:(Class<DBProtocol>)aClass withCondition:(NSString *)condition;
/**
 *  返回所有需要存储的数据表类和表名键值对
 *
 *  @return 数据表类和表名字典
 */

-(NSDictionary *)tableDic;

/**
 *  根据表的userId删除所有数据
 *
 *  @param userId 帐号唯一的Id
 *
 */
-(void)deleteAllWithUserId:(NSString *)userId;

@end
