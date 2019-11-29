//
//  ShoppingCarCell.h
//  夺宝吧
//
//  Created by xiaocai on 15/6/23.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYShopCarModel.h"
#import "ShoppingCarVC.h"
#import "AFFNumericKeyboard.h"
@interface ShoppingCarCell : UITableViewCell<AFFNumericKeyboardDelegate>
@property(nonatomic,assign)NSInteger currentCellIndex;
//所在控制器
@property(nonatomic,weak)ShoppingCarVC *father;
//填充cell的方法
- (void)fillCellWithModel:(WYShopCarModel *)model;
//点击空白处关闭键盘
- (void)closeKeyBoardByVC;
@end
