//
//  RunTimeLanguage.h
//  Vihome
//
//  Created by orvibo on 15-1-15.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "SingletonClass.h"

@interface RunTimeLanguage : SingletonClass

//如果当前语言环境为中文则返回yes，否则返回no
+(BOOL)isZh_Hans;

/**
 *  返回系统语言简称
 *
 *  @return zh：简体中文 zh-TW：繁体中文 en：英文 de：德文 fr：法文
 */
+(NSString *)languageCode;

/**
 *  获取系统语言
 *
 *  @return 系统语言编码
 */
+ (NSString *)getCurrentLanguage;

- (NSString *)runTimeLocalizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName;

@end
