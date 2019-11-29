//
//  VhAPConfigEnDecoder.h
//  ViHomeProLib
//
//  Created by liqiang on 15/8/6.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VhAPConfigMsg.h"
@interface VhAPConfigEnDecoder : NSObject
+ (instancetype)defaultEnDecoder;

- (NSData *)encoderWithMsg:(VhAPConfigMsg *)msg;
- (NSMutableArray *)decoderWithData:(NSData *)data;
@end
