//
//  DeleteLinkageCmd.m
//  HomeMate
//
//  Created by Air on 15/10/13.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "DeleteLinkageCmd.h"

@implementation DeleteLinkageCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_DLK;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.linkageId forKey:@"linkageId"];
    return sendDic;
}
@end
