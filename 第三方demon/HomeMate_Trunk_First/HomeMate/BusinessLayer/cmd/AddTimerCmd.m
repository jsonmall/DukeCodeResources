//
//  AddTimerCmd.m
//  Vihome
//
//  Created by Air on 15-3-10.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "AddTimerCmd.h"

@implementation AddTimerCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_AT;
}

-(NSDictionary *)payload
{
    
    [sendDic setObject:self.deviceId forKey:@"deviceId"];
    [sendDic setObject:self.bindOrder forKey:@"order"];
    [sendDic setObject:[NSNumber numberWithInt:self.value1] forKey:@"value1"];
    [sendDic setObject:[NSNumber numberWithInt:self.value2] forKey:@"value2"];
    [sendDic setObject:[NSNumber numberWithInt:self.value3] forKey:@"value3"];
    [sendDic setObject:[NSNumber numberWithInt:self.value4] forKey:@"value4"];
    [sendDic setObject:[NSNumber numberWithInt:self.hour] forKey:@"hour"];
    [sendDic setObject:[NSNumber numberWithInt:self.minute] forKey:@"minute"];
    [sendDic setObject:[NSNumber numberWithInt:self.second] forKey:@"second"];
    [sendDic setObject:[NSNumber numberWithInt:self.week] forKey:@"week"];
    
    return sendDic;
}

@end
