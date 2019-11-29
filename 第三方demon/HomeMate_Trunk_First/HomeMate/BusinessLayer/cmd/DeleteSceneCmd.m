//
//  DeleteSceneCmd.m
//  Vihome
//
//  Created by Ned on 1/26/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "DeleteSceneCmd.h"

@implementation DeleteSceneCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_DS;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.sceneNo forKey:@"sceneNo"];

    return sendDic;
}


@end
