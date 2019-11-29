//
//  ContainStructAndEnum.h
//  TaiYangHua
//
//  Created by HHLY on 16/2/26.
//  Copyright © 2016年 hhly. All rights reserved.
//

#ifndef ContainStructAndEnum_h
#define ContainStructAndEnum_h

//typedef enum TranslationErrorType TranslationErrorType;
typedef NS_ENUM(NSUInteger, TranslationErrorType) {
    OtherCustomerLeaver     = 2,
    OtherCustomerRefuse     = 1,
    VistorEndSession        = 0,
    AcceptanceSessionFail   = 4
};

typedef NS_ENUM(NSUInteger, UserOnlineState) {
    UserStateOnline = 0,// 在线
    UserStateBusy   = 1,// 忙碌
    UserStateLeave  = 2,// 离开
    UserStateOffline= 3,// 离线
};

typedef NS_ENUM(NSUInteger, InviteUserIntoGroupErrorCode) {
    InviteUserStorageFail       = 0,
    InviteUserStorageSuccessed  = 1,
    InviteUserExistenInGroup    = 2,
};

typedef NS_ENUM(NSUInteger, UserLoginErrorType) {
    LoginError_CodeNotExist             = 0,
    LoginError_CompanyDisable           = 1,
    LoginError_ServiceTimeOut           = 2,
    LoginError_PasswordOrUserNameWrong  = 3,
    LoginError_CustomerFull             = 4,
    LoginError_UserDisable              = 6
};

/*
 会话受理：错误码
 0-访客终止咨询
 1-会话分配给了其他客服
 2-超过客服最大受理数
 4-不存在该会话
 */

#endif /* ContainStructAndEnum_h */
