//
//  UIPhoneNumberViewController.h
//  CloudPlatform
//
//  Created by orvibo on 15/6/3.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//





//=========================================
//                 遗弃
//=========================================


#import "CommonNaviController.h"

@interface UIEmailPhoneNumberViewController : CommonNaviController

-(void)setupNavigationBarBack;

-(void)setupNavigationBarCancel;

/**
 *  初始化界面
 *
 *  @param boundStr 如果有绑定则填写手机号或者Email，没有填nil
 *  @param email    YES表示为绑定邮箱界面， NO，绑定手机号界面
 *  @param bind     YES:已绑定过
 */
-(void)page1_ByPhoneNumberOrEmailBindingViewWithboundStr:(NSString *)boundStr isEmail:(BOOL)email isbind:(BOOL)bind;



@end
