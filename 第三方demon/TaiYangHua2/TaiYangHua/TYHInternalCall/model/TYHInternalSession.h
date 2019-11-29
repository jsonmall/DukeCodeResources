//
//  TYHInternalSession.h
//  TaiYangHua
//
//  Created by Lc on 16/1/21.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, internalMessageType) {
    internalMessageTypeText = 0,
    internalMessageTypeImage   = 1,
    internalMessageTypeTypefile  = 2,
    internalMessageTypeVoice = 3,
};

typedef NS_ENUM(NSInteger, internalSourcetype){
    internalSourcetypeTo = 0,
    internalSourcetypeFrom = 1,
};


@interface TYHInternalSession : NSObject <NSCoding>
// 消息类型
@property (assign, nonatomic) internalMessageType messageType;
// 来源类型
@property (assign, nonatomic) internalSourcetype sourceType;
// 讨论组为讨论组名, 个人 为用户名
@property (copy, nonatomic) NSString *listName;
// 讨论组为讨论组头像, 个人 为用户头像
@property (copy, nonatomic) NSString *headUrl;
// 用户名
@property (copy, nonatomic) NSString *userName;
//  用户头像
@property (copy, nonatomic) NSString *userHeadUrl;
// 本地显示的消息内容
@property (copy, nonatomic) NSAttributedString *text;
// 发送给服务器的消息
@property (copy, nonatomic) NSString *fullText;
// 录音时长
@property (assign, nonatomic) NSInteger duration;
// 录音路径
@property (copy, nonatomic) NSString *recordPath;
// 网络音频文件路径
@property (copy, nonatomic) NSString *recordURL;
// 缩略图路径
@property (copy, nonatomic) NSString *imageThumbnailPath;
// 原图路径
@property (copy, nonatomic) NSString *imageOriginalPath;
// 图片名称
@property (copy, nonatomic) NSString *imageFileName;
// 记录图片索引
@property (assign, nonatomic) NSInteger imageIndex;
// 缩略大小
@property (assign, nonatomic) CGSize thumbnailFrame;
// 当前消息收发时间
@property (assign, nonatomic) long long messageTime;
// 消息索引
@property (assign, nonatomic) NSInteger messageIndex;
// 会话ID
@property (copy, nonatomic) NSString *sessionId;
// 目标客服ID
@property (copy, nonatomic) NSString *targetId;
// 未读语音
@property (assign, nonatomic, getter=isReadVoice) BOOL readVoice;
// 是否发送
@property (assign, nonatomic, getter=isSend) BOOL send;
// 发送失败
@property (assign, nonatomic, getter=isFail) BOOL fail;
// 是否正在播放音频
@property (assign, nonatomic, getter=isVoicePlaying) BOOL voicePlaying;
// 消息ID
@property (copy, nonatomic) NSString *chatId;
/** 会话标志 1-个聊 2-群聊*/
@property (assign, nonatomic) NSInteger targetType;

+ (instancetype)internalsessionWithSocketDict:(NSDictionary *)dict;

+ (instancetype)internalsessionWithHttpDict:(NSDictionary *)dict targetType:(NSInteger)targetType;
+ (NSArray *)internalsessionWithHttpArray:(NSArray *)array targetType:(NSInteger)targetType;

@end
