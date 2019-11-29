//
//  AppDelegate.h
//  Vihome
//
//  Created by Ned on 1/16/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    
    __block UIBackgroundTaskIdentifier _bgTask;
    
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) NSTimer * pushTimer;

@property (nonatomic, getter=isFromScanResult)BOOL fromScanResult;

/**
 *  babbarItem切换是否跳转到根视图，YES:推到根视图，NO:不推到根视图
 */
@property (nonatomic, assign) BOOL tabbarSwitchPopToRoot;

@property (nonatomic ,strong) RDVTabBarController *tabBarCtl;

//@property (nonatomic, strong)NSArray *qrDataArr;

@property (nonatomic, assign) BOOL isLaunchByNotification;   // 是否通过点通知栏启动

- (void)showLoginViewController;
- (void)presentLoginViewController;

@end

