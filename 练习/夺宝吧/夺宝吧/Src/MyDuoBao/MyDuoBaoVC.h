//
//  MyDuoBaoVC.h
//  夺宝吧
//
//  Created by xiaocai on 15/6/15.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyDuoBaoVC : UIViewController


//获取夺宝界面单例的方法
+ (MyDuoBaoVC *)shareMyDuoBaoVC;
//跳往充值页面
- (void)goToPay;
@end
