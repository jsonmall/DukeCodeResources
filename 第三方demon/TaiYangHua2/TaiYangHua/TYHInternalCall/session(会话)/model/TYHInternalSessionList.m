//
//  TYHInternalSessionList.m
//  TaiYangHua
//
//  Created by Lc on 16/1/18.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "TYHInternalSessionList.h"
#import "TYHInternalSession.h"

@implementation TYHInternalSessionList

+ (instancetype)internalSessionListWithInternalSession:(TYHInternalSession *)internalSession
{
    TYHInternalSessionList *sessionList = [[self alloc] init];
    
    sessionList.sessionId = internalSession.sessionId;
    sessionList.targetId = internalSession.targetId;
    sessionList.targetName = internalSession.listName;
    sessionList.lastMessage = internalSession.fullText;
    sessionList.lastMessageTime = [NSString stringWithFormat:@"%zd", internalSession.messageTime];
    sessionList.lastMessageType = internalSession.messageType;
    sessionList.targetType = internalSession.targetType;
    sessionList.headUrl = internalSession.headUrl;
    sessionList.lastIndex = internalSession.messageIndex;

    return sessionList;
}

@end
