//
//  NSString+UrlEncode.h
//  夺宝吧
//
//  Created by weienjie on 15/9/18.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (UrlEncode)
- (NSString *)urlEncode;
- (NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding;

- (NSString *)urlDecode;
- (NSString *)urlDecodeUsingEncoding:(NSStringEncoding)encoding;
@end
