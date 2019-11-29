//
//  TYHInternalSessionList.h
//  TaiYangHua
//
//  Created by Lc on 16/1/18.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TYHInternalSession;

@interface TYHInternalSessionList : NSObject
/** 头像连接*/
@property (copy, nonatomic) NSString *headUrl;
/** 讨论组名称或者客服名称*/
@property (copy, nonatomic) NSString *targetName;
/** 最后一条消息内容*/
@property (copy, nonatomic) NSString *lastMessage;
/** 最后一条时间*/
@property (copy, nonatomic) NSString *lastMessageTime;
/** 最后一条消息类型*/
@property (assign, nonatomic) NSInteger lastMessageType;
/** 未读消息数*/
@property (assign, nonatomic) NSInteger unReadSize;
/** 会话对象ID,可能是userId，或者groupId*/
@property (copy, nonatomic) NSString *targetId;
/** 会话ID*/
@property (copy, nonatomic) NSString *sessionId;
/** 会话数组*/
//@property (copy, nonatomic) NSString *sessions;
///** 处理结果*/
//@property (assign, nonatomic) NSInteger result;
///** 错误码*/
//@property (copy, nonatomic) NSString *errorCode;
/** 会话标志 1-个聊 2-群聊*/
@property (assign, nonatomic) NSInteger targetType;

// 消息索引
@property (assign, nonatomic) NSInteger lastIndex;


+ (instancetype)internalSessionListWithInternalSession:(TYHInternalSession *)internalSession;

@end
