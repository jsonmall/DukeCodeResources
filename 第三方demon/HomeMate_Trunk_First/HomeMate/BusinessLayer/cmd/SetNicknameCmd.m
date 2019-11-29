//
//  SetNicknameCmd.m
//  CloudPlatform
//
//  Created by orvibo on 15/6/28.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "SetNicknameCmd.h"

@implementation SetNicknameCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_SETNICKNAME;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.nickname forKey:@"nickname"];
    return sendDic;
}


@end
