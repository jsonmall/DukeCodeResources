//
//  ActivateLinkageCmd.m
//  HomeMate
//
//  Created by orvibo on 15/10/16.
//  Copyright © 2015年 Air. All rights reserved.
//

#import "ActivateLinkageCmd.h"

@implementation ActivateLinkageCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_ACL;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.linkageId forKey:@"linkageId"];
    [sendDic setObject:@(self.isPause) forKey:@"isPause"];
    return sendDic;
}


@end
