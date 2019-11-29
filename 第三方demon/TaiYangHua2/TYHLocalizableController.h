//
//  TYHLocalizableController.h
//  TaiYangHua
//
//  Created by Vieene on 15/12/11.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import <Foundation/Foundation.h>
// ----- 多语言设置
#define CHINESE @"zh-Hans"
#define ENGLISH @"en"
#define Localizable(key) [[TYHLocalizableController bundle] localizedStringForKey:(key) value:@"" table:nil]
@interface TYHLocalizableController : NSObject
+(NSBundle *)bundle;//获取当前资源文件

+(void)initUserLanguage;//初始化语言文件

+(NSString *)userLanguage;//获取应用当前语言

+(void)setUserlanguage:(NSString *)language;//设置当前语言
@end
