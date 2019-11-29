//
//  AddInfraredKeyCMD.m
//  Vihome
//
//  Created by Ned on 5/8/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "AddInfraredKeyCmd.h"

@implementation AddInfraredKeyCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_AIK;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.deviceId forKey:@"deviceId"];
    [sendDic setObject:self.keyName forKey:@"keyName"];
    
    return sendDic;
}

@end
