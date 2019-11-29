//
//  HMWXDelegateManager.m
//  JQWeChatSDKDemo
//
//  Created by orvibo on 15/10/26.
//  Copyright © 2015年 orvibo. All rights reserved.
//

#import "HMWXDelegateManager.h"
#import "HMWXRequest.h"



@interface HMWXDelegateManager()

@end

@implementation HMWXDelegateManager

+(instancetype)sharedHMWXDelegateManager
{
    static HMWXDelegateManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HMWXDelegateManager alloc] init];
    });
    return manager;
}

#pragma mark -WXApiDelegate
-(void) onReq:(BaseReq*)req
{
    if ([req isKindOfClass:[SendMessageToWXResp class]]) {
        SendMessageToWXResp *response = (SendMessageToWXResp *)req;
        NSInteger errorCode = response.errCode;
        NSString *statusStr;
        switch (errorCode) {
            case WXSuccess:
                statusStr = @"成功";
                break;
            case WXErrCodeCommon:
                statusStr = @"普通错误类型";
                break;
            case WXErrCodeUserCancel:
                statusStr = @"用户点击取消并返回";
                break;
            case WXErrCodeSentFail:
                statusStr = @"发送失败";
                break;
            case WXErrCodeAuthDeny:
                statusStr = @"授权失败";
                break;
            case WXErrCodeUnsupport:
                statusStr = @"微信不支持";
                break;
            default:
                break;
        }
        
        DLog(@"errorcode = %d,%@",response.errCode,statusStr);

    }else if ([req isKindOfClass:[ShowMessageFromWXReq class]]){
        if (!userAccout().isAutoLogin) {
            UINavigationController *selectedViewCtl = (UINavigationController *)ApplicationDelegate.tabBarCtl.selectedViewController;
            [selectedViewCtl popToRootViewControllerAnimated:NO];
            [ApplicationDelegate presentLoginViewController];
        }
    }
}

-(void) onResp:(BaseResp*)resp
{
    
}


@end
