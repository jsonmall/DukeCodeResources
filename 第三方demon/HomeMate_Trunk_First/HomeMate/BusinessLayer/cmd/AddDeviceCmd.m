//
//  AddDeviceCmd.m
//  Vihome
//
//  Created by Ned on 1/26/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "AddDeviceCmd.h"

@implementation AddDeviceCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_AD;
}

-(NSDictionary *)payload
{
    [sendDic setObject:[NSNumber numberWithInt:self.deviceType] forKey:@"deviceType"];
    if (self.deviceName) {
        [sendDic setObject:self.deviceName forKey:@"deviceName"];
    }
    
    [sendDic setObject:self.roomId forKey:@"roomId"];
    [sendDic setObject:self.irDeviceId forKey:@"irDeviceId"];
    [sendDic setObject:self.deviceId forKey:@"deviceId"];

    
    return sendDic;
}


@end
