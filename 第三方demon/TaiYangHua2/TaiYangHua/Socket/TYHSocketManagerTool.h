//
//  TYHSocketManagerTool.h
//  TaiYangHua
//
//  Created by HHLY on 16/1/6.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TYHSessionModel.h"

@class ChartMessage;
@class TYHTransferCusInfo;

/** 测试内部通话用的,无任何意义*/
typedef void(^PushSessionToInternalCallBlock)(id);
/** 测试内部通话用的,无任何意义*/


#pragma mark -- 定义block
typedef void(^AuthenFailBlock)();
typedef void(^PushSessionListsBlock)(NSArray *);
typedef void(^PushSessionBlock)(ChartMessage *);
typedef void(^TransferCustomerBlock)(TYHTransferCusInfo *);
// 转接目标信息，是否被拒绝
typedef void(^TransferConfirmResultBlock)(TYHTransferCusInfo *, BOOL isRefuse);
typedef void(^TotalLeaveMessageBlock)(NSInteger);

typedef void(^PushUserStateBlock)(NSString *userId, UserOnlineState state);

@interface TYHSocketManagerTool : NSObject

@property (nonatomic, copy) NSString *currentSessionID;

@property (nonatomic, assign) BOOL  networkStateNormal;

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

#pragma mark -- 推送客服状态
@property (nonatomic, copy) PushUserStateBlock pushUserStateBlock;

+ (instancetype)shareSocketManager;
// 想服务器写入数据
//- (void)writeDic:(NSDictionary *)parameter tag:(long)tag;
- (void)reconnectHost;
- (void)disconnectHost;

+ (BOOL)isNotEmptyOfShare;


/** 测试内部通话用的,无任何意义*/
@property (copy, nonatomic) PushSessionToInternalCallBlock pushSessionToInternalCallBlock;
/** 测试内部通话用的,无任何意义*/
@end
