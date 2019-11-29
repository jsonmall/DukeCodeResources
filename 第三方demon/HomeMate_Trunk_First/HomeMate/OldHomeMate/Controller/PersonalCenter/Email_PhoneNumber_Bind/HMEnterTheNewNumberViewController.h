//
//  HMEnterTheNewNumberViewController.h
//  HomeMate
//
//  Created by orvibo on 15/8/14.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "CommonNaviController.h"

@interface HMEnterTheNewNumberViewController : CommonNaviController

/**
 *  输入要绑定的新手机号/邮箱页面
 *
 *  @param number  旧的手机号或邮箱，没有填nil
 *  @param isEmail
 *  @param isBind
 */
-(void)setOldNumber:(NSString *)number isEmail:(BOOL)isEmail isBind:(BOOL)isBind;

@end
