//
//  SearchUnbindDevicesCmd.m
//  HomeMate
//
//  Created by Air on 15/11/3.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "SearchUnbindDevicesCmd.h"

@implementation SearchUnbindDevicesCmd
-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_UBD;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.deviceType forKey:@"deviceType"];
    
    return sendDic;
}

@end
