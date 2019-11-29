//
//  AppDelegate+TabbarSwitch.m
//  HomeMate
//
//  Created by orvibo on 15/9/11.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "AppDelegate+TabbarSwitch.h"
#import "HMSearchCOCOController.h"
#import "RemoteGateway+RT.h"

@implementation AppDelegate (TabbarSwitch)

//-(void)loginSuccessfullyProcessed
//{
//    if (self.fromScanResult && !userAccout().hasZigbeeHost) {
//        self.fromScanResult = NO;
//        return;
//    }
//    NSUInteger itemCount = self.tabBarCtl.viewControllers.count;
//    NSArray *gatewayArr = [VihomeDevicesBind bindArr];
//    if (![userAccout() hasZigbeeHost]) {//没有主机，需要显示2个item
//        if (itemCount == 3) {
//            [self setupTabBarController:YES];
//            if (self.tabbarSwitchPopToRoot) {
//                if (gatewayArr.count > 0){
//                    self.tabBarCtl.selectedIndex = 1;
//                }
//            }
//        }else{
//            [UIView animateWithDuration:0 animations:^{
//                [self currentCtlPopToRootViewCtl];
//            }completion:^(BOOL finished) {
//                    self.tabBarCtl.selectedIndex = 0;
//            }];
//        }
//    }else{                          //包含主机，需要显示3个item
//        if(itemCount == 2){
//            [self setupTabBarController:NO];
//            if (gatewayArr.count > 0) {
//                self.tabBarCtl.selectedIndex = 0;
//                if (!self.tabbarSwitchPopToRoot) {//对于局域网搜索COCO未登录的情况，登录成功后任然跳转到搜索coco的界面
//                    CustomNavigationController *naviDevicesCtl = (CustomNavigationController *) self.tabBarCtl.selectedViewController;
//                    HMSearchCOCOController *searchCOCOCtl = [[HMSearchCOCOController alloc] init];
//                    [naviDevicesCtl pushViewController:searchCOCOCtl animated:NO];
//                }
//            }
//        }else{
//            [self currentCtlPopToRootViewCtl];
//        }
//    }
//    self.tabbarSwitchPopToRoot = YES;
//}

-(void)loginSuccessfullyProcessed
{
    if (self.fromScanResult && !userAccout().hasZigbeeHost) {
        self.fromScanResult = NO;
        return;
    }
    if (!self.tabbarSwitchPopToRoot) {//对于局域网搜索COCO未登录的情况，登录成功后不需要跳转到首页，只把登录页面dismiss掉
    }else{
        [self currentCtlPopToRootViewCtl];
        self.tabBarCtl.selectedIndex = 0;
        DLog(@"登录成功，回到首页跟视图");
        [((UINavigationController *)(self.tabBarCtl.selectedViewController)).topViewController viewWillAppear:NO];
    }
    self.tabbarSwitchPopToRoot = YES;
    
#warning 数据多了会卡死
    // 登录成功读取message表数据
        [[RemoteGateway shareInstance] readTableWithUid:@"" tableName:@"message" completion:^(KReturnValue value) {
            
            if (value == KReturnValueSuccess) {
                [[NSNotificationCenter defaultCenter] postNotificationName:kNOTIFICATION_REFRESH_UNREAD_MESSAGE object:nil];
            }
        }];
}

-(void)currentCtlPopToRootViewCtl
{
    if (!self.tabbarSwitchPopToRoot) {
        return;
    }
    CustomNavigationController *naviDevicesCtl = nil;
    naviDevicesCtl = (CustomNavigationController *) self.tabBarCtl.selectedViewController;
    if ([naviDevicesCtl isKindOfClass:[UINavigationController class]]) {
        [naviDevicesCtl popToRootViewControllerAnimated:NO];
    }else{
        [naviDevicesCtl dismissViewControllerAnimated:NO completion:nil];
    }
}


@end
