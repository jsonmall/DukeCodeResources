//
//  FirstVC.h
//  夺宝吧
//
//  Created by xiaocai on 15/6/15.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstVC : UIViewController
//是否一进入是否检查服务器设置
@property (nonatomic , assign) BOOL isCheckServer;
//首次进入界面标志
@property(nonatomic,assign)BOOL firstFlag;
//是否出现的时候刷新数据
@property (nonatomic , assign) BOOL isAppearFreshData;
//没有数据时请求的次数
@property (nonatomic , assign) NSInteger freshCount ;
//是否是下拉刷新
@property(nonatomic , assign) BOOL isPullDownFresh;
//是否是上拉刷新
@property (nonatomic,assign) BOOL isPullUpFresh;
//计时器用于定时刷新
//@property(nonatomic ,strong) NSTimer *timer;

@property(nonatomic ,assign) NSTimeInterval lastFreshDate;
// 获取首页的单例方法
+ (FirstVC *)shareFirstVC;

//改变筛选条件
- (void)changeupdateWithId:(NSString *)cid;
@end
