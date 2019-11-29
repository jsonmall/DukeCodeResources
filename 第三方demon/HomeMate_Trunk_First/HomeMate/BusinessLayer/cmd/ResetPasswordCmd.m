//
//  ResetPasswordCmd.m
//  CloudPlatform
//
//  Created by orvibo on 15/7/8.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "ResetPasswordCmd.h"

@implementation ResetPasswordCmd
-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_RESETPASSWORD;
}


-(NSDictionary *)payload
{
    [sendDic setObject:self.password forKey:@"password"];
    return sendDic;
}

@end
