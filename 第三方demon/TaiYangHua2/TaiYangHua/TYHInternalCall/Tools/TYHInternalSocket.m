//
//  TYHInternalSocket.m
//  TaiYangHua
//
//  Created by Lc on 16/3/14.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "TYHInternalSocket.h"
#import "TYHInternalSession.h"
#import "TYHBaseDatabaseAPI+TYHInternalSession.h"
#import "TYHBaseDatabaseAPI+InternalSessionList.h"
#import <MJExtension.h>
#import "TYHInternalSessionList.h"

@implementation TYHInternalSocket

+ (instancetype)shareInstance
{
    static TYHInternalSocket *internalSocket = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        internalSocket = [[self alloc] init];
    });
    
    return internalSocket;
}

- (void)didReceivePushMessage:(id)json
{
    DLog(@"%@", json);
    TYHInternalSession *internalSession = [TYHInternalSession internalsessionWithSocketDict:json[@"chatDto"]];
    // 将消息存储在session表
    [[TYHBaseDatabaseAPI shareBaseDatabase] insertSession:internalSession];
    // 将消息推送到session界面,在session界面中匹配此条数据
    if (self.pushMessageBlock) {
        self.pushMessageBlock(internalSession);
    }
    
    
    // 将消息更新进sessionList表
//    [[TYHBaseDatabaseAPI shareBaseDatabase] updateSessionListStatus:internalSession messageSorceType:internalSession.sourceType targetType:internalSession.targetType];
//    // 更新sessionList界面
//    NSArray *resultArray = [[TYHBaseDatabaseAPI shareBaseDatabase] selectAllInternalSessionLists];
    
    TYHInternalSessionList *sessionList = [TYHInternalSessionList internalSessionListWithInternalSession:internalSession];
    
    if (self.pushMessageListBlock) {
        self.pushMessageListBlock(sessionList);
    }
    
}
@end
