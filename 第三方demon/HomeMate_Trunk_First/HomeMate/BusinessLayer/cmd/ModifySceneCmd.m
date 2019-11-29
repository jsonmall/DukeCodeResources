//
//  ModifySceneCmd.m
//  Vihome
//
//  Created by Ned on 1/26/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "ModifySceneCmd.h"

@implementation ModifySceneCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_MS;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.sceneNo forKey:@"sceneNo"];
    [sendDic setObject:self.sceneName forKey:@"sceneName"];
    [sendDic setObject:[NSNumber numberWithInt:self.pic] forKey:@"pic"];

    return sendDic;
}


@end
