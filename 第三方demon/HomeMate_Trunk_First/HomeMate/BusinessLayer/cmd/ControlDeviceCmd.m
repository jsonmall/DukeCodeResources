//
//  ControlDeviceCmd.m
//  Vihome
//
//  Created by Ned on 1/26/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "ControlDeviceCmd.h"

@implementation ControlDeviceCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_CD;
}

-(NSDictionary *)payload
{
    if (self.deviceId) {
        [sendDic setObject:self.deviceId forKey:@"deviceId"];
    }
    
    if (self.order) {
        [sendDic setObject:self.order forKey:@"order"];
    }
    [sendDic setObject:@(self.value1) forKey:@"value1"];
    [sendDic setObject:@(self.value2) forKey:@"value2"];
    [sendDic setObject:@(self.value3) forKey:@"value3"];
    [sendDic setObject:@(self.value4) forKey:@"value4"];
    [sendDic setObject:@(self.delayTime) forKey:@"delayTime"];
    if (self.model) {
        [sendDic setObject:self.model forKey:@"model"];
    }
    if (self.isLevelControl) {
        [sendDic setObject:@(self.qualityOfService) forKey:@"qualityOfService"];
        [sendDic setObject:@(self.defaultResponse) forKey:@"defaultResponse"];
    }
    
    if ([self.order isEqualToString:@"ir control"]) {
        [sendDic setObject:@(self.carrierFreq) forKeyedSubscript:@"carrierFreq"];
        if (self.pluseData) {
            [sendDic setObject:self.pluseData forKeyedSubscript:@"pluseData"];
        }
    }
    
    return sendDic;
}

@end
