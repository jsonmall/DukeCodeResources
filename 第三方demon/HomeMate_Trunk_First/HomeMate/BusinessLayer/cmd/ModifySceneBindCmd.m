//
//  ModifySceneBindCmd.m
//  Vihome
//
//  Created by Ned on 1/26/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "ModifySceneBindCmd.h"

@implementation ModifySceneBindCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_MB;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.sceneBindList forKey:@"sceneBindList"];
    
    return sendDic;
}

@end
