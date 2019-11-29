//
//  ModifyHomeNameCmd.m
//  Vihome
//
//  Created by Ned on 1/26/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "ModifyHomeNameCmd.h"

@implementation ModifyHomeNameCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_MN;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.homeName forKey:@"homeName"];
    return sendDic;
}


@end
