//
//  AuthorizedUnlockCmd.m
//  
//
//  Created by Air on 15/12/4.
//
//

#import "AuthorizedUnlockCmd.h"

@implementation AuthorizedUnlockCmd
-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_AUU;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.deviceId forKey:@"deviceId"];
    [sendDic setObject:self.phone forKey:@"phone"];
    [sendDic setObject:@(self.time) forKey:@"time"];
    [sendDic setObject:@(self.number) forKey:@"number"];
    return sendDic;
}
@end
