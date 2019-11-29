//
//  AddSceneCmd.m
//  Vihome
//
//  Created by Ned on 1/26/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "AddSceneCmd.h"

@implementation AddSceneCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_AS;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.sceneName forKey:@"sceneName"];
    [sendDic setObject:[NSNumber numberWithInt:self.pic] forKey:@"pic"];
    
    return sendDic;
}


@end
