//
//  InviteFamilyMemberCmd.m
//  HomeMate
//
//  Created by Air on 15/9/9.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "InviteFamilyMemberCmd.h"

@implementation InviteFamilyMemberCmd
@synthesize userName;
-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_IFM;
}

-(NSDictionary *)payload
{
    return sendDic;
}


@end
