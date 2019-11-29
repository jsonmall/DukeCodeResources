//
//  UITimerPickerViewController.h
//  CloudPlatform
//
//  Created by orvibo on 15/5/13.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "CommonNaviController.h"

@class BLTimingInfoObj;
typedef enum _pickerType{
    KSwitchTimer = 1,//开关定时View
    KOtherTimer,     //其它类型的定时视图
    KCountdown,      //倒计时View
}pickerType;

@interface UITimerPickerViewController : CommonNaviController


@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *deviceId;

@property (nonatomic, strong)HMCountdownModel *countdownObj;

/**
 *  新增定时内部初始化外部不设置该属性/编辑定时外部初始化该属性并赋值
 */
@property (nonatomic, strong) HMTiming *timmingInfoObj;

/**
 *  页面设置，定时或倒计时
 *
 *  @param type  pickerType
 */
-(void)setPickerType:(pickerType)type;

/**
 *  设置操作类型：添加(0)/编辑(1)
 */
-(void)setOperationType:(int)type;

@end
