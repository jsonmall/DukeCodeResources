//
//  LogoffCmd.m
//  Vihome
//
//  Created by Air on 15-3-16.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "LogoffCmd.h"

@implementation LogoffCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_LO;
}

-(NSDictionary *)payload
{
    [sendDic setObject:[NSNumber numberWithInt:self.type] forKey:@"type"];
    
    return sendDic;
}

@end
