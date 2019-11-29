//
//  CheckEmailCodeCmd.m
//  CloudPlatform
//
//  Created by orvibo on 15/6/28.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "CheckEmailCodeCmd.h"

@implementation CheckEmailCodeCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_CHECKEMAILCODE;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.email forKey:@"email"];
    [sendDic setObject:self.checkEmailCode forKey:@"code"];
    return sendDic;
}


@end
