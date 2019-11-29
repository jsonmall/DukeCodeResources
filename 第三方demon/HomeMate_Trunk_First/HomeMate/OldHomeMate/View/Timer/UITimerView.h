//
//  UITimerView.h
//  CloudPlatform
//
//  Created by orvibo on 15/5/13.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TimerYear   @"year"
#define TimerMonth  @"month"
#define TimerDay    @"day"
#define TimerHour   @"hour"
#define TimerMinute @"minute"
#define TimerSecond @"second"
#define TimerOrder  @"order"
#define TimerValue1 @"value1"
#define TimerValue2 @"value2"
#define TimerValue3 @"value3"
#define TimerValue4 @"value4"

@protocol UITimerViewDelegate;
typedef enum{
    KTimerAction = 1,
    KTimerRepeat,
    KTimerDelete,
}TimerMode;

typedef enum _operationType{
    KNewTimer = 0,//新添加定时
    KEditTimer = 1,//编辑定时
}oprationType;


@interface UITimerView : UIView

/**
 *  新添加定时(0)/编辑定时(1)
 */
@property (nonatomic, assign) oprationType operationType;

@property (nonatomic, weak) id<UITimerViewDelegate>delegate;

@property (nonatomic, assign) BOOL   isChange;//如果点击进入页面，设置和之前有改变则提示是否保存定时

/**
 *  初始化定时View
 *
 * @param timerDic 如果新增定时设为nil，编辑Key为：value:NSString类型
          @"year",@"month",@"day",@"hour"（0~23）,@"minute",@"second",
          @"order",@"value1",@"value2",@"value3",@"value4"
 */
-(void)setSwitchTimerViewWithDic:(NSDictionary *)timeDic;

/**
 *  初始化倒计时view
 */
-(void)setCountdownView;


/**
 *  动作label(针对非开关类)
 */
-(void)setActionLabeltext:(NSString *)text;

/**
 *  定时RepeatLabel
 *
 *  @param text
 */
-(void)setTimerRepeatLabelText:(NSString *)text;

/**
 *  获取定时设置的年月日时分秒字典
 *
 *  value:NSString类型   Key：@"year",@"month",@"day",@"hour"（0~23）,@"minute",@"second",@"action"
 */
-(NSDictionary *)getTimeDictonary;

/**
 *  获取倒计时设置的时分秒动作
 *
 *  @return value:字符串， key: @"hour",@"minute",@"second",@"action",@"countdownType"
 */
-(NSDictionary *)getCountdownDictionary;

@end


@protocol UITimerViewDelegate <NSObject>

-(void)didSelectedBtnAtIndex:(TimerMode)index;

@end