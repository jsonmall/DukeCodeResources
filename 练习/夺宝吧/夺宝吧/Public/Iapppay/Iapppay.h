//
//  Iapppay.h
//  夺宝吧
//
//  Created by weienjie on 15/9/18.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IapppayKit/IapppayOrderUtils.h>
#import <IapppayKit/IapppayKit.h>
#import "PayInfoModel.h"

//商户在爱贝注册的应用ID
static NSString *mOrderUtilsAppId = @"3002823873";

//用户在商户应用的唯一标识（必须）String(32)
//static NSString *mOrderAppUserId = @"xiaocai@dbba.cn";

//商品ID
static NSString *mOrderWaresId = @"1";

//商品名称
static NSString *mOrderWaresName = @"iOS_夺宝吧支付";

//渠道号
static NSString *mOrderUtilsChannel = @"db8";

//回调地址写死
//支付结果后台回调地址
#define mOrderUtilsNotifyurl    [NSString stringWithFormat:@"%@api/ApiPay/notify/iapppay",DBB_IP]

//商户验签公钥
//static NSString *mOrderUtilsCheckResultKey = @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCS47EQzXlzD+uo2goLtytu94+MHZjyrSGszfpAT9MbhUrxyykxvw3W+F1mn8L2IVghkPvt/X6xDHjeCpP3+mzBCqQW9VnzXHq7F1NFDaeejC5o1TSrGBQ57yihxT58TlcqMTrw5zADux8i3+CAH7Ti0GGkqT8EfzxCl0E+wvquiQIDAQAB";
//
////商户在爱贝注册的应用ID对应的应用私钥
//static NSString *mOrderUtilsCpPrivateKey = @"MIICXgIBAAKBgQCQ6E0Ukpch10I64pTckNxkHYYzabR/tXuTZpSpzYpjIq9/lRSgXTQJZ6QY7x0HhZ3s4kLb45xTEbwiZeuBBl9YEb+eXCpbtl/hoVGEw4DAO/qzPUN6PrSMiDQjSEdcrqtvxOzqLWh7Km//ojPUTeZxdfiin/etsQSU8hytYCxOEwIDAQABAoGAGu7ibMF2T7bnu3QjwP83x2/pYqLyBo6fwlzdotXuM9Ddl7QI2mmYY2sdB/lhhuVh3gaL8LzUcGgqdKZG6HtbuwYwXpRuIyHV+2HGMAIjwknddCNDMjdRBSw18m/ewXHUa5MuyrMuJX1+UFVymzMbfjEhPUyAL2Rav+16TS6iADkCQQDBWeRxoBpO7g8xOj2Y+313KCWDcKTx+0e6ckmZILVmh9+ewpzMm7bimLQa66mTPJ5dJBT69mS+L1CeSrL+cPN3AkEAv9wYWMbVcZfWBAiyfVnPoNOwPZwo3vNOPDdxsv4wvMLr5Mv2Xv7lycoELtiuwoJJXSU0ekomnhecC3oobhCJRQJBAIWI3dsTpdfJVji7bntPhVFcKrxieaid0OYVtHrLOj07rddptP0iteY9bHYDODR18zGEj/DbZqxq5RTNpl1QCPUCQQCWGhKuOfk5osncZBWIvmATeiqTOP4812uo7tO0buwgcftuCCibT57ljXhSUlH/eUD+b6Ir3qFx5BTAYfUJj0RlAkEAmgvI+05enB0hSweQB6KMYqGb5sCbr4TqJwbRCVqPpU6UfR5R6nE+65X9s7se3FtEBZ5z3EYGUYfBvIndG1GkLg==";


@interface Iapppay : NSObject

@property (nonatomic , copy) NSString *mOrderUtilsAppId;

@property (nonatomic , copy) NSString *mOrderAppUserId;

@property (nonatomic , copy) NSString *mOrderWaresId;

@property (nonatomic , copy) NSString *mOrderWaresName;

@property (nonatomic , copy) NSString *mOrderUtilsChannel;

@property (nonatomic , copy) NSString *mOrderUtilsCheckResultKey;

@property (nonatomic , copy) NSString *mOrderUtilsCpPrivateKey;

//支付商品或者支付充值标志
@property (nonatomic,assign)BOOL isChongZhiFlag;

@property(nonatomic , strong) PayInfoModel *payModel;

- (instancetype)initWithPayModel:(PayInfoModel*)payModel;

//- (void)iappayWithOrderId:(NSString *)orderId price:(NSString *)pirce privateInfo:(NSString *)info;
//爱贝微信支付支付接口
- (void)iappayWithOrderId:(NSString *)orderId price:(NSString *)pirce privateInfo:(NSString *)info wareName:(NSString*)waresName
;

@end
