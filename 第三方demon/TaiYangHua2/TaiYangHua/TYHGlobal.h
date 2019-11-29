//
//  TYHGlobalConstant.h
//  TaiYangHua
//
//  Created by Vieene on 15/12/15.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import <Foundation/Foundation.h>
#define KOriginalPhotoImagePath   \
[[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"OriginalPhotoImages"]
#define khandListChangeNotification @"khandListChangeNotification"
#define kUnreadMsgsChangeNotification @"kUnreadMsgsChangeNotification"
#define kReceiveUnreadHandleNum @"TYHreceiveUnreadHandleNum"
#define kTransferTipMessageViewChangeHeightNotification @"TransferTipMessageViewChangeHeightNotification"
#define kUserLogoutNotification @"UserLogoutNotification"
#define kFSVoiceBubbleShouldStopNotification @"FSVoiceBubbleShouldStopNotification"

extern NSString * kTYHLoginDomain;
extern NSString * const kTYHAppImageURL;
extern NSString * const kTYHLoginDomainSuffix;
extern NSString * const kTYHAppVoiceURL;
extern NSString * const kTYHAppImageURLDownLoad;
extern NSString * const kTYHAppImageURLUpload;
extern NSString *  kTYHAppFileAddrss;
extern NSString * const kTYHAppFileAddrssOne;
extern NSString * const kTYHAppFileAddrssTwo;
extern NSString * const kTYHAppFileAddrssThree;
//extern NSString * const kTYHAppFileAddrssFour;

extern NSString * const kTYHAppVoiceURLDownload;
extern NSString * const kTYHAppVoiceURLUpload;

//extern NSString * const kTYHAppServerURL;
extern NSString *  kTYHAppSocketHost;
extern uint16_t    kTYHAppSocketPort;
extern NSString * const kupgrade;

extern NSString * const klogin;//登录
extern NSString * const kquerySessionLists;//查询回话列表
extern NSString * const kacceptSession;//受理会话
extern NSString * const kquerySession;//查询会话内容
extern NSString * const pushUserInfo;//推送用户信息
extern NSString * const pushSessionLists;//推送会话列表
extern NSString * const pushSession;//推送会话内容
extern NSString * const ksendChat;//发送消息
extern NSString * const kendSession;//.结束会话
extern NSString * const kqueryTransferableUsers;//查询可转接客服
extern NSString * const kinitiateTransferRequert;//发起转接请求
extern NSString * const pushInitiateTransferRequert;//推送待确认转接请
extern NSString * const pushTranferConfirmResult;//推送转接确认结果
extern NSString * const kQueryAuthorityConfig;// 查询留言处理权限
extern NSString * const ktransferSession;//会话转接
extern NSString * const kprohibitVisitor;//访客阻止
extern NSString * const kqueryLeaveMessageUnHandleAmount;//查询访客未处理留言总数
extern NSString * const pushLeaveMessageUnHandleAmount;//推送访客未处理留言总数
extern NSString * const kqueryLeaveMessages;//查询访客留言
extern NSString * const kqueryLeaveMessageDetail;//查询留言详情
extern NSString * const khandleLeaveMessage;//留言处理
extern NSString * const kupdateUserState;//更新状态
extern NSString * const kresetPassword;//密码修改
extern NSString * const klogout;//退出
extern NSString * const kqueryPhrases;
extern NSString * const kupload;
extern NSString * const ksendTranferConfirmResult;//转接确认结果
extern NSString * const kinactive;//发送非激活状态信息
extern NSString * const kQueryTargetServerUrl;


extern NSString * const kfindUserSessions;
extern NSString * const kfindUserContacts;
extern NSString * const kfindUserGroups;
extern NSString * const kcreateGroup;
extern NSString * const kaddGroupUser;
extern NSString * const kfindGroupUsers;
extern NSString * const kexitGroup;
extern NSString * const kfindSessionMsgs;
extern NSString * const ksendGroupChat;
extern NSString * const kfindUserSession;
extern NSString * const kupdateSessionTm;

@interface TYHGlobal : NSObject
/**
 *  设置服务器的http和socket地址
 *
 *  @param jsonDic 服务器返回的数据
 */
+ (void)setupServerSetingWithDic:(NSDictionary *)jsonDic;
/**
 *  清楚服务器列表
 */
+ (void)clearLocalServerlist;
/**
 *  获取SDCacheimage的缓存路径
 */
+ (NSString *)getSdwebImagediskCache;

/**
 *  保存本地图片到SD的缓存路径
 *
 *  @param localImageUrl 本地的图片Path
 *  @param originUrl     远程网络的URL
 *  @param thumbUrlUrl   远程网络的缩略图（suoluetu） URL
 *
 *  @return 成功和失败
 */
+ (BOOL)saveLocalImageToSdCache:(NSString *)localImageUrl destinationoriginalUrl:(NSURL *)originUrl
                destinationthumbUrl:(NSURL *)thumbUrlUrl;


@end
