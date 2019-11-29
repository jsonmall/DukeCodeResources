//
//  AppDelegate+HMMessagePush.h
//  HomeMate
//
//  Created by liuzhicai on 15/8/21.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (HMMessagePush)

/**
 *  注册远程消息推送服务
 */
- (void)registerPushService;

/**
 *  将推送过来的消息存到本地
 *
 *  @param dict    userInfo
 */
- (void)saveMsgDataWithDictionary:(NSDictionary *)dict;

- (void)pushNotificationsEnabled;


@end
