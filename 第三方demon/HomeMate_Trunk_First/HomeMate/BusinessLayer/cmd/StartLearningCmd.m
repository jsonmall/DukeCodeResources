//
//  StartLearningCmd.m
//  Vihome
//
//  Created by Ned on 1/26/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "StartLearningCmd.h"

@implementation StartLearningCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_SL;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.deviceId forKey:@"deviceId"];
    [sendDic setObject:self.order forKey:@"order"];

    if (self.keyName.length > 0) {
        [sendDic setObject:self.keyName forKey:@"keyName"];
    }
    
    return sendDic;
}


@end
