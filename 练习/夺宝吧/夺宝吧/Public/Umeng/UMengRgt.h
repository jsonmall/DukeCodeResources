//
//  UMengRgt.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/27.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UMSocial.h"
@interface UMengRgt : NSObject
+ (void)rgtUmengInFo :(NSDictionary *)launchOptions;
//分享
+ (void)shareWithVC:(UIViewController *)vc delegate:(id <UMSocialUIDelegate>)delegate;
@end
