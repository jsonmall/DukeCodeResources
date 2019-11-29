//
//  GetSmsCmd.m
//  Vihome
//
//  Created by Air on 15-1-29.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "GetSmsCmd.h"

@implementation GetSmsCmd


-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_GSC;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.phoneNumber forKey:@"phone"];
    [sendDic setObject:@(self.type) forKey:@"type"];
    return sendDic;
}
-(NSString *)userName
{
    return nil;
}

@end
