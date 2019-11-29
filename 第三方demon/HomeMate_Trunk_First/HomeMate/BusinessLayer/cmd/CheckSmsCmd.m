//
//  CheckSmsCmd.m
//  Vihome
//
//  Created by Air on 15-1-29.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "CheckSmsCmd.h"

@implementation CheckSmsCmd


-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_CSC;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.authCode forKey:@"code"];
    [sendDic setObject:self.phoneNumber forKey:@"phone"];
    return sendDic;
}
-(NSString *)userName
{
    return nil;
}

@end
