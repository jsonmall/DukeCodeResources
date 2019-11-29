//
//  HMWXDelegateManager.h
//  JQWeChatSDKDemo
//
//  Created by orvibo on 15/10/26.
//  Copyright © 2015年 orvibo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXApi.h"

@interface HMWXDelegateManager : NSObject<WXApiDelegate>

+(instancetype)sharedHMWXDelegateManager;

@end
