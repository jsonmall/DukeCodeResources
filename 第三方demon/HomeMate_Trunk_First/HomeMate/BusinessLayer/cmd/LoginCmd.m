//
//  LoginCmd.m
//  Vihome
//
//  Created by Ned on 1/26/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "LoginCmd.h"

@implementation LoginCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_CL;
}

-(NSDictionary *)payload
{
    if (self.password) {
        [sendDic setObject:self.password forKey:@"password"];
    }
    [sendDic setObject:[NSNumber numberWithInt:self.type] forKey:@"type"];
    return sendDic;
}

@end
