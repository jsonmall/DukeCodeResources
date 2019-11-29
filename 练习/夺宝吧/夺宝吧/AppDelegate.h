//
//  AppDelegate.h
//  夺宝吧
//
//  Created by xiaocai on 15/6/15.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYZfbPay.h"
#import "LeftMenuVC.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property float autoSizeScaleX;
@property float autoSizeScaleY;

//记录自己的跟视图
@property (nonatomic,strong)UIViewController *rtVC;
//支付宝对象
@property (nonatomic,strong)WYZfbPay *zfbPay;
//左菜单
@property (nonatomic,strong)LeftMenuVC *leftMenuVC;

@property (nonatomic , assign) BOOL isLaunch;
@end

