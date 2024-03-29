//
//  SecurityCmd.m
//  HomeMate
//
//  Created by orvibo on 16/3/7.
//  Copyright © 2016年 Air. All rights reserved.
//

#import "SecurityCmd.h"

@implementation SecurityCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_SCR;
}

-(NSDictionary *)payload
{
    if (self.securityId) {
        [sendDic setObject:self.securityId forKey:@"securityId"];
    }
    [sendDic setObject:@(self.isArm) forKey:@"isArm"];
    [sendDic setObject:@(self.delay) forKey:@"delay"];
    return sendDic;
}


@end
