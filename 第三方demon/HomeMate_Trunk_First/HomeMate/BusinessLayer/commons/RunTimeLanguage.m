//
//  RunTimeLanguage.m
//  Vihome
//
//  Created by orvibo on 15-1-15.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "RunTimeLanguage.h"

@interface RunTimeLanguage()

@property (nonatomic, assign) BOOL stingFileExist;
@property (nonatomic, retain) NSString *languageCode;
@property (nonatomic, retain) NSArray *customLocalizedStringKeys;

@end

@implementation RunTimeLanguage
@synthesize languageCode;
@synthesize stingFileExist;
@synthesize customLocalizedStringKeys;

+(NSArray *)customLocalizedStringKeys{
    
    NSArray *array = @[@"Taking_pictures"
                       ,@"registered_account"
                       ,@"about_orvibo"
                       ,@"camera_error"];
    return array;
}

- (NSString *)runTimeLocalizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName
{
//    NSString *table = [NSString stringWithFormat:@"Custom-%@",self.languageCode];
//    
//    if (stingFileExist && [customLocalizedStringKeys containsObject:key]) {
//        
//        NSString *localizedString=[[NSBundle mainBundle] localizedStringForKey:key value:value table:table];
//        if (localizedString) {
//            return localizedString;
//        }
//    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:self.languageCode ofType:@"lproj"];
    NSBundle *languageBundle = [NSBundle bundleWithPath:path];
    NSString *localizedString=[languageBundle localizedStringForKey:key value:value table:nil];
    
    if (![localizedString isEqualToString:key]) {
        return localizedString;
    }
    // 默认都返回英文
    NSString *defaultPath = [[NSBundle mainBundle] pathForResource:@"en" ofType:@"lproj"];
    NSBundle *defaultBundle = [NSBundle bundleWithPath:defaultPath];
    NSString *defaultString=[defaultBundle localizedStringForKey:key value:value table:nil];
    return defaultString;
}

+ (id)shareInstance
{
    Singleton();
}
-(id)init
{
    self = [super init];
    if (self) {
        
        self.languageCode = [[self class]languageCode];
        //self.stingFileExist = [[self class]stingFileExist];
        //self.customLocalizedStringKeys = [[self class]customLocalizedStringKeys];
    }
    return self;
}


+(NSString *)languageCode
{
    NSString *currentLanguage = [RunTimeLanguage getCurrentLanguage];
    if(stringContainString(currentLanguage, @"zh")){ //汉语
        return @"zh-Hans";
    }else if (stringContainString(currentLanguage, @"fr")){ //法语
        return @"fr";
    }else if (stringContainString(currentLanguage, @"de")){ //德语
        return @"de";
    }
    
    NSArray *localizations = [[NSBundle mainBundle]localizations];
    if ([localizations containsObject:currentLanguage]) { // 已本地化当前语言
        return currentLanguage;
    }
    return @"en"; // 默认英语
}
+(BOOL)stingFileExist
{
    NSString *table = [NSString stringWithFormat:@"Custom-%@",[[self class] languageCode]];
    NSString *tableFile = [table stringByAppendingString:@".strings"];
    NSString *tablePath =[[[NSBundle mainBundle]bundlePath]stringByAppendingPathComponent:tableFile];
   return [[NSFileManager defaultManager]fileExistsAtPath:tablePath];
}

+(BOOL)isZh_Hans
{
    static BOOL isZh_Hans = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *currentLanguage = [RunTimeLanguage getCurrentLanguage];
        
        isZh_Hans = stringContainString(currentLanguage, @"zh");
        
    });
    return isZh_Hans;
}

+ (NSString *)getCurrentLanguage
{
    //    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //    NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
    //    NSString *currentLanguage = [languages firstObject];
    
    static NSString *currentLanguage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSArray *languages = [NSLocale preferredLanguages];
        currentLanguage = [languages firstObject];
        DLog(@"currentLanguage:%@" , currentLanguage);
        
    });
    
    return currentLanguage;
}

@end
