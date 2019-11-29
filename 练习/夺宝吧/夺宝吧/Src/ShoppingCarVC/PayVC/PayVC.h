//
//  PayVC.h
//  夺宝吧
//
//  Created by xiaocai on 15/6/29.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayVC : UIViewController

//支付模型 总共四个
//支付宝
@property (nonatomic , strong) PayInfoModel *zfbModel;
//iapppay微信
@property (nonatomic , strong) PayInfoModel *iapppayWXModel;
//iapppay支付宝
@property (nonatomic , strong) PayInfoModel *iapppayzfbModel;
//pingpp京东
@property (nonatomic , strong) PayInfoModel *pingppJDModel;
//数据源
@property (nonatomic,strong)NSMutableArray *data;
//支付单号
@property (nonatomic,strong)NSString *orderId;
//总价
@property (nonatomic,assign)NSInteger allPrice;
//第三方支付code
@property (nonatomic,strong)NSString *paycode;


//支付宝是否支持标志
@property (nonatomic,assign)int zfbflag;
//京东是否支持标志
@property (nonatomic,assign)int jdflag;
//iapppay是否支持标志 微信是否支持
@property (nonatomic,assign)int iapppayflag;
//iapppay是否支持支付宝
@property (nonatomic,assign) int iapppayFlagAlipay;

//支付方式
@property (nonatomic,strong)NSString *payType;
//取消订单
-(void)cancelOrder;

@property (nonatomic , strong) UIAlertView *alertView;

@end
