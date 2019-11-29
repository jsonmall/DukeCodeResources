//
//  TYHDataSource.h
//  TaiYangHua
//
//  Created by Vieene on 16/1/16.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYHDataSource : NSObject


/**
 *  两条消息相隔多久显示一条时间戳
 */
@property (nonatomic, readonly) NSInteger showTimeInterval;
- (instancetype)initWithShowTimeInterval:(NSTimeInterval)timeInterval;

/**
 *  往数据源中加入数据
 */
- (void)addMessages:(NSArray*)messages;

/**
 *  删除数据中的最后一条消息
 */
- (void)deleteLastModel;
/**
 *  删除数据源数据
 */
- (void)removeAllmsg;
/**
 *  数据的个数
 */
- (NSInteger)numberOfsource;
/**
 *  获取数据源的模型数据
 *
 *  @param row 行数
 *
 *  @return 模型
 */
- (id)getModelWithRow:(NSInteger )row;

@end
