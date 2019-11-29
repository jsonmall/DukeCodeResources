//
//  MyDuoBaoView.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/13.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyDuoBaoVC.h"
@interface MyDuoBaoView : UIView
@property(nonatomic,weak)MyDuoBaoVC *father;
//刷新个人信息
- (void)updateMyInfo;
//跳往充值页面
- (void)goToPay;
- (void)showBtn;
@end
