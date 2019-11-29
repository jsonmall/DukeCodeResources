//
//  NSString+Path.h
//  获取沙盒路径
//
//  Created by 二爷 on 13-09-26.
//  Copyright (c) 2013年 ErYe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Path)

/** 获取文档目录 */
+ (NSString *)documentPath;
/** 获取缓存目录 */
+ (NSString *)cachePath;
/** 获取临时目录 */
+ (NSString *)tempPath;

/** 添加文档路径 */
- (NSString *)appendDocumentPath;
/** 添加缓存路径 */
- (NSString *)appendCachePath;
/** 添加临时路径 */
- (NSString *)appendTempPath;

@end
