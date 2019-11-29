//
//  RegisterCmd.m
//  Vihome
//
//  Created by Air on 15-1-24.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "RegisterCmd.h"

@implementation RegisterCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_RST;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.phone forKey:@"phone"];
    [sendDic setObject:self.email forKey:@"email"];
    [sendDic setObject:self.password forKey:@"password"];
    
    return sendDic;
}

@end
