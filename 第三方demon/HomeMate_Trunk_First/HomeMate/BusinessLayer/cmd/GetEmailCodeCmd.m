//
//  GetEmailCodeCmd.m
//  CloudPlatform
//
//  Created by orvibo on 15/6/28.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "GetEmailCodeCmd.h"

@implementation GetEmailCodeCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_GETEMAILCODE;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.email forKey:@"email"];
    [sendDic setObject:[NSNumber numberWithInt:self.type] forKey:@"type"];
    return sendDic;
}

@end
