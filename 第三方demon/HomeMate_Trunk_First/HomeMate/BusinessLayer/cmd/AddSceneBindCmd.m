//
//  AddSceneBindCmd.m
//  Vihome
//
//  Created by Ned on 1/26/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "AddSceneBindCmd.h"

@implementation AddSceneBindCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_AB;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.sceneBindList forKey:@"sceneBindList"];
    
    return sendDic;
}


@end
