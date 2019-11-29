//
//  UserInfo.h
//  夺宝吧
//
//  Created by xiaocai on 15/6/19.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject
// 认证token
@property (nonatomic,strong)NSString *user_token;
// token过期时间
@property (nonatomic,strong)NSString *user_token_outTime;
// 允许刷新认证token
@property (nonatomic,strong)NSString *user_token_refresh;
// 用户uid
@property (nonatomic,strong)NSString *user_uid;
// 用户名
@property (nonatomic,strong)NSString *user_name;
//头像
@property (nonatomic,strong)NSString *user_header_img_path;
// 用户邮箱
@property (nonatomic,strong)NSString *user_email;
// 用户手机
@property (nonatomic,strong)NSString *user_phone;
//夺币
@property (nonatomic,strong)NSString *user_money;
//积分
@property (nonatomic,strong)NSString *user_jifen;
//年龄
@property (nonatomic,strong)NSString *user_age;
//性别
@property (nonatomic,strong)NSString *user_sex;

/*****************分享要用到的**************/
@property (nonatomic,strong)NSString *user_share_title;
@property (nonatomic,strong)NSString *user_share_content;
@property (nonatomic,strong)NSString *user_share_url;

//保存用户信息
+ (void)writeUserInfoWithDic:(NSDictionary *)dic;
//刷新用户信息
+ (void)updateUserInfoWithDic:(NSDictionary *)dic;
//删除用户信息
+ (void)deleteUserInfo;
//判断用户是否处于登录状态
+ (BOOL)isUserLogin;
//判断用户是否保存过用户信息
+ (BOOL)isUserInfoExist;
//快捷获取用户id
+ (NSString *)getUserID;
//快捷获取用户token
+ (NSString *)getUserToken;
//快捷获取用户refreshtoken
+ (NSString *)getRefreshToken;
//快捷获取用户账号
+ (NSString *)getUserCount;

//设置分享内容
+ (void)setShareTitle:(NSString *)title Content:(NSString *)content ShareURL:(NSString *)shareUrl;
//获取分享标题
+(NSString *)getShareTitle;
//获取分享文本
+(NSString *)getShareContent;
//获取分享链接
+(NSString *)getShareUrl;

//一键加群的key
+(void)keyForAddQQ:(NSString *)key Num:(NSString *)qq;
+(NSString*)getKeyForQQ;
+(NSString*)getNumForQQ;

//获取user的单例
//+(instancetype)shareUserInfo;
@end
