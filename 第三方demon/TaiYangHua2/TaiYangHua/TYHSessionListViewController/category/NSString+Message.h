//
//  NSString+Message.h
//  MessageDisplay
//
//  Created by zhoubin@moshi on 14-5-10.
//  Copyright (c) 2014年 Crius_ZB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Message)

- (NSString *)stringByTrimingWhitespace;

- (NSUInteger)numberOfLines;
/**
 *  model wds字符装换
 */
- (NSString *)strSwitchFromJsonStr;
/**
 *  获取录音的local文件路径
 */
- (NSString *)getVoiceCacheUrlstr;

@end
