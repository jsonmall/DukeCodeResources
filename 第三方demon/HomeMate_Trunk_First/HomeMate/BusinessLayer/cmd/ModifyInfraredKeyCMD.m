//
//  ModifyInfraredKeyCMD.m
//  Vihome
//
//  Created by Ned on 5/8/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "ModifyInfraredKeyCmd.h"

@implementation ModifyInfraredKeyCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_MIK;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.deviceIrId forKey:@"deviceIrId"];
    [sendDic setObject:self.keyName forKey:@"keyName"];
    [sendDic setObject:self.deviceId forKey:@"deviceId"];
    
    return sendDic;
}

@end
