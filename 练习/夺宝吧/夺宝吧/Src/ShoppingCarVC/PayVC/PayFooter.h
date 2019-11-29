//
//  PayFooter.h
//  夺宝吧
//
//  Created by xiaocai on 15/6/29.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayVC.h"
@interface PayFooter : UIView

//支付宝
@property (nonatomic , strong) PayInfoModel *zfbModel;
//iapppay微信
@property (nonatomic , strong) PayInfoModel *iapppayWXModel;
//iapppay支付宝
@property (nonatomic , strong) PayInfoModel *iapppayzfbModel;
//pingpp京东
@property (nonatomic , strong) PayInfoModel *pingppJDModel;


@property (nonatomic,weak)PayVC *father;
//支付单号
@property (nonatomic,strong)NSString *orderId;
//总价
@property (nonatomic,assign)NSInteger allPrice;
//第三方支付code
@property (nonatomic,strong)NSString *paycode;
//支付方式
@property (nonatomic,strong)NSString *payType;


//支付宝是否支持标志
@property (nonatomic,assign)int zfbflag;
//京东是否支持标志
@property (nonatomic,assign)int jdflag;
//iapppay是否支持标志 微信是否支持
@property (nonatomic,assign)int iapppayflag;
//iapppay是否支持支付宝
@property (nonatomic,assign) int iapppayFlagAlipay;

@property (weak, nonatomic) IBOutlet UIView *zfView;

@property (weak, nonatomic) IBOutlet UIView *jdView;

@property (weak, nonatomic) IBOutlet UIView *iapWxView;

@property (weak, nonatomic) IBOutlet UIView *iapAliView;

//支付选项的高度约束
//调整支付宝坐标
- (void)changeZFB;
//调整京东支付坐标
- (void)changeJD;
//调整爱贝微信支付坐标坐标
- (void)changeIAPPPay;
//调整爱贝支付宝坐标
- (void)changeIAPPPayAlipay;
//调整whiteView的大小
-(void)changeFrame;

- (void)ifNoAll;

//支付按钮点击激活的方法
- (void)payBtnOnClick;

//初始化

- (void)setDefaultPay;

//setLineView是用于划线的
- (void)setLineView;


@end
