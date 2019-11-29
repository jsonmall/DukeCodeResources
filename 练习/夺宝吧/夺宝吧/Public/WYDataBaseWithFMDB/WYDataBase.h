//
//  WYDataBase.h
//  查车价
//
//  Created by 王琰 on 14-9-14.
//  Copyright (c) 2014年 王琰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "WYShopCarModel.h"
#import "NewsModel.h"
@interface WYDataBase : NSObject
{
   //数据库
    FMDatabase *_database;
}
//获取数据库管理对象单例的方法
+ (WYDataBase *)sharedDataBase;
//返回数据的路径
+ (NSString *)getDataBasePath;
//关闭数据库
- (void)closeDataBase;
//清空数据库
- (BOOL)deleteDatabase;
/***********
 *搜索记录模块
 **************/
//向搜索记录表中插入新记录
- (BOOL)insertSeachText:(NSString *)seachText;
//查询数据库中是否包含当前搜索记录
- (BOOL)isExistSeachText:(NSString *)seachText;
//获取所有搜索记录
- (NSMutableArray *)getAllSeachText;
//删除所有搜索记录
- (BOOL)deleAllSeachText;

/***********
 *购物车模块
 **************/
//向购物车中添加信息
- (BOOL)insertPdcToCarWithModel:(WYShopCarModel *)model;
//向购物车(兴趣)中添加信息
- (BOOL)insertPdcToIntrestCarWithModel:(WYShopCarModel *)model;
//获取购物车(兴趣)列表
- (NSArray *)getAllpdcInIntrestCar;
//购物车是否存在商品

- (BOOL)isExistInCarWithModel:(WYShopCarModel*)model;

//获取购物车列表
- (NSArray *)getAllpdcInCar;
//修改购物车中产品的数量
- (BOOL)updataCountInCar:(int)newCount pdc:(int)pdcSID;
//修改购物车中产品的选中状态
- (BOOL)updateSelectedState:(int)select pdc:(int)pdcId;
//删除购物车中得产品记录
- (BOOL)deletePdcInCarById:(int)pdcSId;

/***********
 *系统消息模块
 **************/
//插入一条消息
- (BOOL)insertNewToTBNew:(NewsModel *)model;
//判断消息是否存在记录中
- (BOOL)isExitInTabNew:(NSString *)newId;
//改变消息是否阅读过的状态
- (BOOL)changeScanfFlagWithNewId:(NSString *)newId;
//获取一个model比对
- (NewsModel *)getNewsModelById:(NSString *)newId;
//获取所有的消息记录
- (NSArray *)getAllNews;

@end
