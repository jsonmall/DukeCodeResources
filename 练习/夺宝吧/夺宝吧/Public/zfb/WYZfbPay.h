//
//  WYZfbPay.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/16.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AlipaySDK/AlipaySDK.h>
#import "PayInfoModel.h"

@interface WYZfbPay : NSObject

@property (nonatomic , strong) PayInfoModel *payModel;
//支付商品或者支付充值标志
@property (nonatomic,assign)BOOL isChongZhiFlag;
-(void)zfbPayWithOrderNum:(NSString *)OrderNum OrderId:(NSString *)orderid PdcTitle:(NSString *)pdcTitle PdcDesc:(NSString *)desc Price:(NSString *)price;
//取消订单
-(void)cancelOrder;
//取消充值订单
- (void)cancelChangzhiOrder;
@end
