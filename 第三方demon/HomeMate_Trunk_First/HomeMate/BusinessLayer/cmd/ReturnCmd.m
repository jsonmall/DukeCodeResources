//
//  ReturnCmd.m
//  Vihome
//
//  Created by Air on 15-2-13.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "ReturnCmd.h"

@implementation ReturnCmd

@synthesize cmd = myCmd;

-(VIHOME_CMD)cmd
{
    return myCmd;
}

-(NSDictionary *)payload
{
    [sendDic setObject:[NSNumber numberWithInteger:self.status] forKey:@"status"];
    if (self.messageId) {
        [sendDic setObject:self.messageId forKey:@"messageId"];
    }
    return sendDic;
}
@end
