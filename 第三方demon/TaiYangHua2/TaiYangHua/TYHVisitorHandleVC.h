//
//  TYHVisitorHandleVC.h
//  TaiYangHua
//
//  Created by Vieene on 15/12/22.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYHVisitorHandleVC : UIViewController

@property (nonatomic, strong) NSMutableArray *msgHandleList;
/**
 *  刷新界面
 */
- (void)reloadTableView;
// 设置初始时间和结束时间 默认是当天时间
- (void)setBeginTime:(NSString *)beginTime endTime:(NSString *)endTime;

@end
