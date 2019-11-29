//
//  SensorPushCmd.m
//  HomeMate
//
//  Created by Air on 15/10/13.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "SensorPushCmd.h"

@implementation SensorPushCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_SP;
}

-(NSDictionary *)payload
{
    [super payload];
    if (self.startTime) {
        [sendDic setObject:self.startTime forKey:@"startTime"];
    }
    if (self.endTime) {
        [sendDic setObject:self.endTime forKey:@"endTime"];
    }
    [sendDic setObject:@(self.authorizedId) forKey:@"authorizedId"];
    [sendDic setObject:@(self.week) forKey:@"week"];
    return sendDic;
}

@end
