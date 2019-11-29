//
//  DeleteFamilyMemberCmd.m
//  HomeMate
//
//  Created by Air on 15/9/9.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "DeleteFamilyMemberCmd.h"

@implementation DeleteFamilyMemberCmd
@synthesize userName;

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_DFM;
}

-(NSDictionary *)payload
{
    return sendDic;
}
@end
