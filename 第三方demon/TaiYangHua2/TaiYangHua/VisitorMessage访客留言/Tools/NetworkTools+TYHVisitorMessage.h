//
//  NetworkTools+TYHVisitorMessage.h
//  TaiYangHua
//
//  Created by HHLY on 15/12/29.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import "NetworkTools.h"
#import "TYHTransferCusInfo.h"

@class TYHVisitorLeaveMsgInfo;
@interface NetworkTools (TYHVisitorMessage)
/**
 *  查看访客留言
 *
 *  @param model     登录信息
 *  @param state     处理状态
 *  @param startTime 开始时间
 *  @param endTime   结束时间
 *  @param successed 请求成功时调用
 *  @param failure   请求失败时调用
 */
- (void)queryLeaveMessagesHandleState:(NSInteger)state
                            startDate:(NSString *)startTime
                              endDate:(NSString *)endTime
                            successed:(void (^)(NSArray *msgInfoList))successed
                              failure:(void (^)(NSString *errorStr))failure;
/**
 *  查看访客留言详细信息
 *
 *  @param model     登录信息
 *  @param msgId     留言消息id
 *  @param successed 请求成功时调用
 *  @param failure   请求失败时调用
 */
- (void)queryLeaveMessageDetailMsgId:(NSInteger)msgId
                           successed:(void (^)(TYHVisitorLeaveMsgInfo *msgInfo))successed
                             failure:(void (^)(NSString *errorStr))failure;
/**
 *  处理访客的留言信息
 *
 *  @param model     登录信息
 *  @param msgId     留言id
 *  @param remark    客服备注
 *  @param successed 请求成功时调用
 *  @param failure   请求失败时调用
 */
- (void)handleLeaveMessageMsgId:(NSInteger)msgId
                         remark:(NSString *)remark
                      successed:(void (^)())successed
                        failure:(void (^)(NSString *errorStr))failure;
/**
 *  发送转接确认结果
 *
 *  @param transferInfo 转接对象信息
 *  @param successed    操作成功时调用
 *  @param failure      操作失败时调用
 */
- (void)sendTranferConfirmResult:(TYHTransferCusInfo *)transferInfo
                   confirmResult:(BOOL)confirmResult
                       successed:(void (^)())successed
                         failure:(void (^)(NSString *errorStr))failure;

/**
 *  查询处理留言的权限
 */
- (void)queryAuthorityConfigSuccessed:(void (^)(NSDictionary *authorityDic))successed
                              failure:(void (^)(NSString *errorStr))failure;

@end
