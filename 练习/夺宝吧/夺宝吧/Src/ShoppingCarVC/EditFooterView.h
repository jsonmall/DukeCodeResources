//
//  EditFooterView.h
//  夺宝吧
//
//  Created by xiaocai on 15/8/18.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingCarVC.h"
@interface EditFooterView : UIView
@property (nonatomic,weak)ShoppingCarVC *father;
//取消选中
- (void)cancelSelect;
//刷新选中个数
- (void)updateCount;
@end
