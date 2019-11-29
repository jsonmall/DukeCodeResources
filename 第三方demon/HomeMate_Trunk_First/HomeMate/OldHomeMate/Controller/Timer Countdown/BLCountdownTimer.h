//
//  BLCountdownTimer.h
//  CloudPlatform
//
//  Created by orvibo on 15/5/26.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BLCountdownTimer : NSObject

@property (nonatomic, copy) NSString *uid;//判断倒计时是否属于当前界面的插座，避免设备显示其它设备的倒计时

@property (nonatomic, assign) BOOL isExistCountdown;

/**
 *  单例
 */
+(instancetype)SharedCountdownTimer;

/**
 *  添加响应对象
 */
-(void)idArrAddObject:(id)object;

/**
 *  删除响应对象
 */
-(void)idArrRemoveObject:(id)object;
-(void)idArrRemoveAllObject;

/**
 *  开始定时器
 *
 *  @param second 倒计时时间
 *
 *  @param action 倒计时动作
 *
 */
-(void)startTimerWithSecond:(int)second action:(NSString *)action;

/**
 *  停止定时器
 */
-(void)stopTimer;

/**
 *  当前倒计时秒
 */
-(int)getCountdownSecond;

/**
 *  获取倒计时响应的事件
 */
-(NSString *)getCountdownEvent;


/**
 *  响应对象中必须实现的方法，刷新UI显示秒数
 */
-(void)secondHasChanged:(int)second action:(NSString *)action;

@end
