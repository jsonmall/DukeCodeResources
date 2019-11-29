//
//  TYHErrorAssert.m
//  TaiYangHua
//
//  Created by Lc on 16/1/15.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "TYHErrorAssert.h"
#import "TYHLoginViewController.h"
#import "TYHSettingStatusChangeView.h"

@interface TYHErrorAssert () <UIAlertViewDelegate>

@end


static BOOL isShowView;

@implementation TYHErrorAssert

+ (BOOL)assertErrorWithResult:(id)result
{
    DDLogDebug(@"error code: %zd", [result[@"errorCode"] intValue]);
    switch ([result[@"errorCode"] intValue]) {
            DLog(@"%zd", [result[@"errorCode"] intValue]);
            
        case 00007:
            DDLogDebug(@"账号异地登录。。。。。。。。。。%p, %i", &isShowView, isShowView);
            if (!isShowView) {
                DDLogDebug(@"已经可以提示当前的账号异地登录了。。。。。。。。。。。。。");
                [self showAlertView];
                return YES;
            }
            break;
            
        default:
            break;
            
    }
    
    return NO;
}

+ (void)showAlertView
{
    isShowView = YES;
    [AuthModel sharedInstance].logining = NO;
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:Localizable(@"警告") message:Localizable(@"您的账号在另一地点登录,您被迫下线,如果不是您本人操作,那么您的密码很可能泄露,建议您修改密码!") preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * okAction = [UIAlertAction actionWithTitle:Localizable(@"确定") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self transferToLoginViewController];
        isShowView = NO;
    }];
    [alertVc addAction:okAction];
    
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController ;
//    [vC presentViewController:alertVc animated:YES completion:nil];
    
    // 目的 : 让此提醒框显示在最前面
    [[[UIApplication sharedApplication].windows firstObject] addSubview:vc.view];
    [vc presentViewController:alertVc animated:YES completion:nil];
}

//去登录页面
+  (void)transferToLoginViewController
{
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"AutoLogin"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    TYHLoginViewController* loginController = [[TYHLoginViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginController];
    [UIApplication sharedApplication].keyWindow.rootViewController = nav;
}

@end
