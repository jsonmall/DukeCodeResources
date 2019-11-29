//
//  UIForgotPasswordViewController.h
//  CloudPlatform
//
//  Created by orvibo on 15/7/6.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "CommonNaviController.h"

@protocol UIForgotPasswordViewControllerDelegate;

@interface UIForgotPasswordViewController : CommonNaviController

@property (nonatomic, assign) int  currentPage;//页数，从1开始
@property (nonatomic, copy) NSString    *phoneEmailStr;
@property (nonatomic, weak) id<UIForgotPasswordViewControllerDelegate>delegate;

@end


@protocol UIForgotPasswordViewControllerDelegate <NSObject>

/**
 *  重置密码回调
 */
-(void)handleModifySuccessful;

@end