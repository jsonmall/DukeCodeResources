//
//  HmTimeOutManager.h
//  HomeMate
//
//  Created by liqiang on 15/8/19.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VhAPConfigMsg.h"

@interface HmTimeOutManager : NSObject
+ (HmTimeOutManager *)getTimeOutManager;
- (void)addVhAPConfigMsg:(VhAPConfigMsg *)msg;
- (NSTimeInterval)removeMsg:(VhAPConfigMsg *)msg;
- (void)removAllMsg;
@end
