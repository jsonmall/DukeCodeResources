//
//  AddCountdownCmd.m
//  
//
//  Created by Air on 15/12/4.
//
//

#import "AddCountdownCmd.h"

@implementation AddCountdownCmd
-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_ADCD;
}

-(NSDictionary *)payload
{
    [sendDic setObject:self.deviceId forKey:@"deviceId"];
    [sendDic setObject:self.order forKey:@"order"];
    [sendDic setObject:@(self.value1) forKey:@"value1"];
    [sendDic setObject:@(self.value2) forKey:@"value2"];
    [sendDic setObject:@(self.value3) forKey:@"value3"];
    [sendDic setObject:@(self.value4) forKey:@"value4"];
    [sendDic setObject:@(self.time) forKey:@"time"];
    [sendDic setObject:@(self.startTime) forKey:@"startTime"];
    return sendDic;
}
@end
