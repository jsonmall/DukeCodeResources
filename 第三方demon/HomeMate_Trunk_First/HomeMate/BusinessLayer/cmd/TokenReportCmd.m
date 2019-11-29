//
//  TokenReportCmd.m
//  HomeMate
//
//  Created by liuzhicai on 15/8/20.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "TokenReportCmd.h"

@implementation TokenReportCmd

-(NSString *)language
{
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = [languages firstObject];
    return currentLanguage;
}

-(NSString *)phoneToken
{
    return [UserDefaults objectForKey:@"token"];
}

-(NSString *)phoneSystem
{
    return @"iOS";
}

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_TR;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.language forKey:@"language"];
    [sendDic setObject:self.phoneSystem forKey:@"os"];
    [sendDic setObject:self.phoneToken forKey:@"phoneToken"];
    
    return sendDic;
}


+ (BOOL)toKenIsNull
{
    if ([UserDefaults objectForKey:@"token"]) {
        return NO;
    }
    return YES;
}




@end
