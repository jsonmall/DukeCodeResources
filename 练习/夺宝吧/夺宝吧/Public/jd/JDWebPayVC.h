//
//  JDWebPayVC.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/17.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JDWebPayVC : UIViewController
//网页链接
@property (nonatomic,strong)NSString *urlStr;
//上方标题
@property (nonatomic,strong)NSString *mtitle;
//支付商品或者支付充值标志
@property (nonatomic,assign)BOOL isChongZhiFlag;

@property (nonatomic, copy) NSString *money;

@end
