//
//  NSString+MD5.h
//  夺宝吧
//
//  Created by xiaocai on 15/9/20.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface NSString (MD5)
// The string's MD5 hash
- (NSString *) MD5Hash;
@end
