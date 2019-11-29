//
//  ReadedMsgNumCmd.m
//  HomeMate
//
//  Created by liuzhicai on 15/8/20.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "ReadedMsgNumCmd.h"

@implementation ReadedMsgNumCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_RMN;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.phoneToken forKey:@"phoneToken"];
    [sendDic setObject:@(self.num) forKey:@"num"];
    return sendDic;
}

- (NSString *)phoneToken
{
    return [UserDefaults objectForKey:@"token"];
}

+ (BOOL)toKenIsNull
{
    NSLog(@"%@",[UserDefaults objectForKey:@"token"]);
    if ([UserDefaults objectForKey:@"token"]) {
        return NO;
    }
    return YES;
}

@end
