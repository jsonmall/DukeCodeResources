//
//  VHAPDevice.h
//  HomeMate
//
//  Created by liqiang on 15/8/11.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface VHAPDevice : NSObject
@property (nonatomic, copy) NSString * deviceName;
@property (nonatomic, copy) NSString * mac;
@property (nonatomic, copy) NSString * protocolVersion;

@property (nonatomic, copy) NSString * modelId;
@property (nonatomic, copy) NSString * softwareVersion;
@property (nonatomic, copy) NSString * hardwareVersion;

@end
