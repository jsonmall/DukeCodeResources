//
//  NSString+Base64.h
//  数据加密
//
//  Created by 二爷 on 13-09-26.
//  Copyright (c) 2013年 ErYe. All rights reserved.
//
/**
 * 命令行测试命令
 *
 * BASE64编码(abc)
 * $ echo -n abc | base64
 * BASE64解码(YWJj，abc的编码)
 * $ echo -n YWJj | base64 -D
 */

#import <Foundation/Foundation.h>

@interface NSString (Base64)

@property (nonatomic, readonly) NSString *base64Encode;
@property (nonatomic, readonly) NSString *base64Decode;

@end
