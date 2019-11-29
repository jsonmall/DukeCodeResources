//
//  HMSecurityVerificationViewController.h
//  HomeMate
//
//  Created by orvibo on 15/8/14.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "CommonNaviController.h"

/**
 *  有获取验证码的界面都可以调用该控制器
 */
@interface HMSecurityVerificationViewController : CommonNaviController

/**
 *  设置验证码界面参数
 *
 *  @param number  手机号或邮箱
 *  @param isEmail 是否是邮箱
 *  @param isSV    YES:安全验证界面   NO:其它验证码界面
 */
-(void)setOldNumber:(NSString *)number isEmail:(BOOL)isEmail isSV:(BOOL)isSV isBind:(BOOL)isBind;

@end
