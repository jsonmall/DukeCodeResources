//
//  addLinkageCmd.m
//  Vihome
//
//  Created by Air on 15-4-21.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "addLinkageCmd.h"

@implementation AddLinkageCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_AL;
}



-(NSDictionary *)payload
{
    
    [sendDic setObject:self.linkageName forKey:@"linkageName"];
    if (self.linkageConditionList.count) {
        [sendDic setObject:self.linkageConditionList forKey:@"linkageConditionList"];
    }
    if (self.linkageOutputList.count) {
        [sendDic setObject:self.linkageOutputList forKey:@"linkageOutputList"];
    }
    return sendDic;
}

@end
