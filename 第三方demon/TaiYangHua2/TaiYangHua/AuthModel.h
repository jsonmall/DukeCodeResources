//
//  AuthModel.h
//  TaiYangHua
//
//  Created by Vieene on 15/12/15.
//  Copyright © 2015年 hhly. All rights reserved.
//  认证相关模型

#import <Foundation/Foundation.h>
#import "TYHUserInfo.h"
#import "NetworkTools.h"
@interface AuthModel : NSObject <NSCoding>
extern NSString * const AccoutMsgModel;

+ (instancetype)sharedInstance;
//保存账号信息到本地
+ (void)saveData;
//从本地读取账号信息
+ (instancetype)readData;
@property (nonatomic,copy)NSString * companyCode;
@property (nonatomic,copy)NSString * loginName;
@property (nonatomic,copy)NSString * password;
@property (nonatomic,copy)NSString * onLine;
@property (nonatomic,assign)loginSourceType  loginSource;
@property (nonatomic,copy)NSString * ip;
@property (nonatomic,copy)NSString * area;
@property (nonatomic,copy)NSString * deviceToken;

@property (nonatomic,copy)NSString * result;
@property (nonatomic,copy)NSString * errorCode;
@property (nonatomic,copy)NSString * lastLoginTime;
@property (nonatomic,copy)NSString * token;
@property (nonatomic,copy)NSString * loginTime;
@property (nonatomic,assign)loginSourceType lastLoginSource;
@property (nonatomic,strong)TYHUserInfo *userInfo;
//服务器上的版本号
@property (nonatomic,strong)NSString *serVersion;
//本地的版本号
@property (nonatomic,strong)NSString *locVersion;
@property (nonatomic,assign,getter=isLoigning)BOOL logining;
- (void)clearCache;
- (void)clearLocalCache;

@end
