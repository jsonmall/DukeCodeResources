//
//  NSString+Path.m
//  获取沙盒路径
//
//  Created by 二爷 on 13-09-26.
//  Copyright (c) 2013年 ErYe. All rights reserved.
//

#import "NSString+Path.h"

@implementation NSString (Path)

/** 获取文档目录 */
+ (NSString *)documentPath
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

/** 获取缓存目录 */
+ (NSString *)cachePath
{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}

/** 获取临时目录 */
+ (NSString *)tempPath
{
    return NSTemporaryDirectory();
}

/** 添加文档路径 */
- (NSString *)appendDocumentPath
{
    return [[NSString documentPath] stringByAppendingPathComponent:self];
}

/** 添加缓存路径 */
- (NSString *)appendCachePath
{
    return [[NSString cachePath] stringByAppendingPathComponent:self];
}

/** 添加临时路径 */
- (NSString *)appendTempPath
{
    return [[NSString tempPath] stringByAppendingPathComponent:self];
}

@end
