//
//  VhDeviceBind.h
//  HomeMate
//
//  Created by liqiang on 15/8/12.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VHAPDevice.h"

typedef void(^ BindCallback)(KReturnValue retunValue,NSDictionary *returnDic);

@interface VhDeviceBind : NSObject
@property (nonatomic, assign) BOOL isStop;

/**
 *  是否取消绑定
 *
 *  @param isStop
 */
- (void)stopBindDevice:(BOOL)isStop;

/**
 *  解绑设备
 *
 *  @param device
 */
- (void)unBindDevice:(VHAPDevice *)device callback:(BindCallback)callback;


/**
 *  绑定设备
 *
 *  @param device
 *  @param callback
 */
- (void)bindDevice:(VHAPDevice *)device callback:(BindCallback)callback;
@end
