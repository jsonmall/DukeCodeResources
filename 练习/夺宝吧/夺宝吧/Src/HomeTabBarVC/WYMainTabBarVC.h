//
//  WYMainTabBarVC.h
//  TabBar主界面框架
//
//  Created by 王琰 on 14-11-21.
//  Copyright (c) 2014年 王琰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYMainTabBarVC : UITabBarController
//主界面的定制tabBar
@property (nonatomic,strong)UIView *customTabBar;
//获取主界面单例
+ (WYMainTabBarVC *)shareMainTaBarVC;
//tabBar的隐藏或者出现
- (void)tabBarHiddenOrNot;
//获取购物车按钮 用于加入购物车动画
- (UIView *)getShoppingCarBtn;
//购物车按钮个数提示刷新
- (void)updateCountToCar;
//搜索商品按钮点击后，改变TabBar 及menu结构的方法
- (void)seachBtnOnClick:(NSString *)text;
//登录成功后调用
- (void)changeSelectedWithIndex:(NSInteger)index;
@end
