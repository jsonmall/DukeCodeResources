//
//  TYHTransferCusInfo.h
//  TaiYangHua
//
//  Created by HHLY on 16/1/7.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  转接客服请求
 */

@interface TYHTransferCusInfo : NSObject
/** 用户id、名字、公司代码、昵称 */
@property (nonatomic,copy)NSString * userId;
@property (nonatomic,copy)NSString * userName;
@property (nonatomic,copy)NSString * companyCode;
@property (nonatomic,copy)NSString * nickName;
/** 需要转接的会话id */
@property (nonatomic,copy)NSString * sessionId;

@property (nonatomic, assign) TranslationErrorType errorType;

@end
