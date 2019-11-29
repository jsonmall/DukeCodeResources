//
//  DeviceSearchCmd.m
//  Vihome
//
//  Created by Ned on 1/26/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "DeviceSearchCmd.h"

@implementation DeviceSearchCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_DC;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.Type forKey:@"type"];
    return sendDic;
}


@end
