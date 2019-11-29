//
//  TYHSocketManagerTool.h
//  TaiYangHua
//
//  Created by HHLY on 16/1/6.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "TYHBaseSocket.h"
#import "TYHSessionModel.h"

@class ChartMessage;
@class TYHTransferCusInfo;
@class TYHInternalGroupList;

#pragma mark -- 定义block
typedef void(^AuthenFailBlock)();
typedef void(^PushSessionListsBlock)(NSArray *);
typedef void(^PushSessionBlock)(TYHChartMessage *);
typedef void(^TransferCustomerBlock)(TYHTransferCusInfo *);
// 转接目标信息，是否被拒绝
typedef void(^TransferConfirmResultBlock)(TYHTransferCusInfo *, BOOL isRefuse);
typedef void(^TotalLeaveMessageBlock)(NSInteger);
// 推送客服状态的更改
typedef void(^PushUserStateBlock)(NSString *userId, UserOnlineState state);
typedef void(^PushGroupListInfoBlock)(TYHInternalGroupList *groupInfo);

@interface TYHSocketManagerTool : TYHBaseSocket

#pragma mark -- 认证Block
@property (nonatomic, copy)   AuthenFailBlock       authenFailBlock;

#pragma mark -- 推送会话Block
/** 获取已处理的会话 */
@property (nonatomic, copy) PushSessionListsBlock handleSessionBlock;
/** 获取未处理会话 */
@property (nonatomic, copy) PushSessionListsBlock unHandleSessionBlock;
/** 推送会话内容 */
@property (nonatomic, copy) PushSessionBlock      pushSessionBlock;

#pragma mark -- 请求转接Block
/** 请求转接 */
@property (nonatomic, copy) TransferCustomerBlock transferCusBlock;
/** 请求转接结果 */
@property (nonatomic, copy) TransferConfirmResultBlock transferConResultBlock;
/** 未处理的离线留言数 */
@property (nonatomic, copy) TotalLeaveMessageBlock totalLeaveMsgBlock;

#pragma mark -- 内部聊天推送block
@property (nonatomic, copy) PushUserStateBlock pushUserStateBlock;
@property (copy, nonatomic) PushGroupListInfoBlock pushGroupListBlock;

#pragma mark - Socket Model Property
@property (nonatomic, copy) NSString *currentSessionID;

+ (instancetype)shareSocketManager;

+ (BOOL)isEmpty;
@end
