//
//  HMTimerAndCountdownViewController.h
//  HomeMate
//
//  Created by liuzhicai on 15/12/7.
//  Copyright © 2015年 Air. All rights reserved.
//

#import "HMUITimerListViewController.h"

@interface HMTimerAndCountdownViewController : UIViewController

@property (nonatomic, strong)HMDevice *device;

@property (nonatomic, assign)BOOL isCountdown;

- (void)setDevice:(HMDevice *)device;

@end
