//
//  HMTimerCountdownLogic.h
//  HomeMate
//
//  Created by liuzhicai on 15/12/8.
//  Copyright © 2015年 Air. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  如果是倒计时任务，则返回倒计时对象，否则返回nil
 *
 *
 *  @param model                 倒计时对象
 */
typedef void (^CountdownTaskBlock)(BOOL isCountdown, HMCountdownModel *model);

@interface HMTimerCountdownLogic : NSObject

@property (nonatomic, copy)CountdownTaskBlock countdownBlock;

/**
 *  给定设备的最小时间的定时
 *
 *  @param deviceId 设备Id
 *
 * 
 *  @return  字典类型
 *  NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:minTime,@"time",value,@"event",comps,@"CurrentDateComponents",@(minTimeInterval),@"minTimeInterval", nil];
 */
+ (NSDictionary *)minimumTimerWithDeviceId:(NSString *)deviceId;

/**
 *  查找最近时间的倒计时
 *
 *  @param deviceId
 *
 *  @return 返回最近的倒计时对象
 */
+ (HMCountdownModel *)recentestCountdownObjWithDeviceId:(NSString *)deviceId;

/**
 *  倒计时跟定时任务一起比较，返回最近的任务
 *
 *  @param deviceId 设备Id
 *  @param block    如果最近任务是倒计时，则返回倒计时对象，以便开启定时器读秒；否则返回nil
 *
 *  @return 返回最近的任务的字符串
 */
+ (NSString *)recentestTaskStrWithDeviceId:(NSString *)deviceId countdownBlock:(CountdownTaskBlock)block;

/**
 *  返回命令字符串
 *
 *  @param model 倒计时对象
 *
 *  @return 如 “后开启”、“后关闭”
 */
+ (NSString *)orderStrWithCountdownObj:(HMCountdownModel *)model;

/**
 *  根据倒计时剩余秒数，返回格式字符串
 *
 *  @param remainSecs 倒计时剩余秒数
 *
 *  @return 字符串
 */
+ (NSString *)formateStrWithSecs:(int)remainSecs;
@end
