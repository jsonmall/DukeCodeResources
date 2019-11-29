//
//  UIViewController+Reset.m
//  Vihome
//
//  Created by Air on 15/7/21.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "UIViewController+Reset.h"

@implementation UIViewController (Reset)

-(void)addGatewayResetObserver
{
    [self addNotification:kNOTIFICATION_GATEWAY_RESET selector:@selector(gatewayReset) object:nil];
}
-(void)gatewayReset
{
    DLog(@"class:%@ fuc:%s",NSStringFromClass([self class]),__FUNCTION__);
    
    [self removeAllObserver];
    
    UIViewController *topVc = self.navigationController.topViewController;
    if (topVc != self) {
        [topVc.navigationController popToRootViewControllerAnimated:YES];
    }
}

@end
