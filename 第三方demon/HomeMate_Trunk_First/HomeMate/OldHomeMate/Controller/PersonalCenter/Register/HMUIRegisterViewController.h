//
//  UIRegisterViewController.h
//  CloudPlatform
//
//  Created by orvibo on 15/6/6.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "CommonNaviController.h"

@protocol HMUIRegisterViewControllerDelegate;

@interface HMUIRegisterViewController : CommonNaviController

@property (nonatomic, weak) id<HMUIRegisterViewControllerDelegate>delegate;

-(void)registerPhoneNumOrEmailWithTipString:(NSString *)tipString isEmail:(BOOL)isEmail;

@end


@protocol HMUIRegisterViewControllerDelegate <NSObject>

/**
 *  想注册的用户名已经被注册过，点击登陆按钮回调
 *
 *  @param userName 手机或邮箱
 */
-(void)didSelectedUserName:(NSString *)userName;

/**
 *  注册成功
 *
 *  @param userName 用户名
 *  @param password 密码
 */
-(void)didRegistrationSuccessfulWithUserName:(NSString *)userName md5Password:(NSString *)password;

@end