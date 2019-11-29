//
//  TYHInternalHttpParamTool.h
//  TaiYangHua
//
//  Created by Lc on 16/3/22.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TYHInternalSession.h"
@interface TYHInternalHttpParamTool : NSObject
/**
 *  查询最大的索引
 *
 *  @return 参数
 */
+ (NSDictionary *)sessionsWithSessionId:(NSString *)sessionId;

/**
 *  返回会话历史记录参数
 *
 *  @param sessionId 会话ID
 *  @param maxIndex  从哪个索引开始
 *  @param num       查询条数
 *  
 *  @return 参数
 */
+ (NSDictionary *)sessionsWithSessionId:(NSString *)sessionId maxIndex:(NSInteger)maxIndex num:(NSInteger)num;

/**
 *  返回发送文本消息的参数
 *
 *  @param session 模型
 *
 *  @return 参数
 */
+ (NSDictionary *)textParamsWithSession:(TYHInternalSession *)session;

/**
 *  返回上传语音的参数
 *
 *  @param session 模型
 *
 *  @return 参数
 */
+ (NSDictionary *)voiceParamsWithSession:(TYHInternalSession *)session;

/**
 *  返回发送语音URL的参数
 *
 *  @param session 模型
 *  @param fileURL 服务器返回的语音路径
 *
 *  @return 参数
 */
+ (NSDictionary *)voiceURLParamsWithSession:(TYHInternalSession *)session fileURL:(NSString *)fileURL;

/**
 *  返回上传图片的参数
 *
 *  @param session 模型
 *
 *  @return 参数
 */
+ (NSDictionary *)imageParamsWithSession:(TYHInternalSession *)session;

/**
 *  返回发送图片URL的参数
 *
 *  @param session 模型
 *  @param fileURL 服务器返回的语音路径
 *
 *  @return 参数
 */
+ (NSDictionary *)imageURLParamsWithSession:(TYHInternalSession *)session fileURL:(NSString *)fileURL;

+ (NSDictionary *)updateSessionTmWithSessionId:(NSString *)sessionId messageTime:(NSInteger)messageTime index:(NSInteger)index;
@end
