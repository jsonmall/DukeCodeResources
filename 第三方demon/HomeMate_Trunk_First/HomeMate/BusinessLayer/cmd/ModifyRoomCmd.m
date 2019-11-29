//
//  ModifyRoomCmd.m
//  Vihome
//
//  Created by Ned on 1/26/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "ModifyRoomCmd.h"

@implementation ModifyRoomCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_MR;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.roomId forKey:@"roomId"];
    [sendDic setObject:self.roomName forKey:@"roomName"];
    [sendDic setObject:@(self.roomType) forKey:@"roomType"];
    [sendDic setObject:self.floorId forKey:@"floorId"];
    return sendDic;

}


@end
