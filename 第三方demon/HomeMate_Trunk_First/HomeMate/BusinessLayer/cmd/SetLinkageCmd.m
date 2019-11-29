//
//  SetLinkageCmd.m
//  HomeMate
//
//  Created by Air on 15/10/13.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "SetLinkageCmd.h"

@implementation SetLinkageCmd
-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_SLK;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.linkageId forKey:@"linkageId"];
    [sendDic setObject:@(self.type)forKey:@"type"];

    if (self.linkageName.length) {
        [sendDic setObject:self.linkageName forKey:@"linkageName"];
    }
    if (self.linkageConditionAddList) {
        [sendDic setObject:self.linkageConditionAddList forKey:@"linkageConditionAddList"];
    }
    if (self.linkageConditionModifyList) {
        [sendDic setObject:self.linkageConditionModifyList forKey:@"linkageConditionModifyList"];
    }
    if (self.linkageConditionDeleteList) {
        [sendDic setObject:self.linkageConditionDeleteList forKey:@"linkageConditionDeleteList"];
    }
    if (self.linkageOutputAddList) {
        [sendDic setObject:self.linkageOutputAddList forKey:@"linkageOutputAddList"];
    }
    if (self.linkageOutputModifyList) {
        [sendDic setObject:self.linkageOutputModifyList forKey:@"linkageOutputModifyList"];
    }
    if (self.linkageOutputDeleteList) {
        [sendDic setObject:self.linkageOutputDeleteList forKey:@"linkageOutputDeleteList"];
    }
    
    return sendDic;
}
@end
