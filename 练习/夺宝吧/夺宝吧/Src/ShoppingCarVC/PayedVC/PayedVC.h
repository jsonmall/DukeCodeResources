//
//  PayedVC.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/15.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayedView.h"
@interface PayedVC : UIViewController
@property (nonatomic,assign)ResType rltType;
//支付商品或者支付充值标志
@property (nonatomic,assign)BOOL isChongZhiFlag;
//支付金额
@property (nonatomic,strong)NSString *money;
//刷新界面
- (void)updateViews;
@end
