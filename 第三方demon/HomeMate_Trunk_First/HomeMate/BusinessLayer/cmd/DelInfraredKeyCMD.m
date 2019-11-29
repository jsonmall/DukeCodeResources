//
//  DelInfraredKeyCMD.m
//  Vihome
//
//  Created by Ned on 5/8/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "DelInfraredKeyCmd.h"

@implementation DelInfraredKeyCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_DIK;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.deviceIrId forKey:@"deviceIrId"];
    [sendDic setObject:self.deviceId forKey:@"deviceId"];
    
    return sendDic;
}

@end
