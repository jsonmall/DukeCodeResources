//
//  TYHSessionModel.m
//  TaiYangHua
//
//  Created by Vieene on 15/12/22.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import "TYHSessionModel.h"
#import "NSString+Message.h"
@implementation TYHSessionModel

//- (NSString *)lastMessageContent
//{
//    return @"这是最后一条消息。。。";
//}
- (void)setLastMessageContent:(NSString *)lastMessageContent
{
    _lastMessageContent = lastMessageContent;
    _lastMessageContent  = [lastMessageContent strSwitchFromJsonStr];
}
@end
