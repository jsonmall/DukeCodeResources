//
//  DeviceBindCmd.m
//  Vihome
//
//  Created by Ned on 1/26/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "DeviceBindCmd.h"

@implementation DeviceBindCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_DBD;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.bindUID forKey:@"uid"];
    
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    
    if (self.user.length) {
        [dict setObject:self.user forKey:@"user"];
    }
    
    if (self.password.length) {
        [dict setObject:self.password forKey:@"password"];
        
    }
    if (self.deviceType.length) {
        [sendDic setObject:self.deviceType forKey:@"deviceType"];
        
    }
    [dict setObject:@(self.type) forKey:@"type"];
    
    [sendDic setObject:dict forKey:@"payload"];
    
    return sendDic;
}
-(NSString *)userName
{
    return nil;
}

@end
