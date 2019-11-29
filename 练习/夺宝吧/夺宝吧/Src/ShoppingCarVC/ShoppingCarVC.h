//
//  ShoppingCarVC.h
//  夺宝吧
//
//  Created by xiaocai on 15/6/15.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ShoppingCarVC : UIViewController
@property(nonatomic,assign)NSInteger currentCellIndex;
//数据源
@property(nonatomic,strong)NSMutableArray *data;
//tab
@property(nonatomic,strong)UITableView *tableView;
//当购物车出现时是否刷新购物车内容
@property (nonatomic,assign) BOOL firstFlag;
//获取购物车界面的单例
+ (ShoppingCarVC *)shareShoppingCarVC;
//刷新计数view的实现
-(void)reloadFooter;
//编辑数量时调整坐标
- (void)changeOffsetWithFrame:(CGRect)frame;
//完成按钮点击时还原坐标
- (void)backOffset;
//还原编辑前状态
- (void)cancelEdit;
@end
