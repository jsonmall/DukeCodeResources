//
//  ShiWuFooter.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/21.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RewardModel.h"
#import "RewardDetailVC.h"
@interface ShiWuFooter : UIView
//是否是自己的标志
@property (nonatomic,assign)BOOL isMineFlag;
@property (nonatomic,weak)RewardDetailVC *father;
@property (nonatomic,strong)RewardModel *model;

//去掉遮罩
- (void)removeZheZhao;
//填充默认地址
- (void)fillAddressWith:(NSString *)name Phone:(NSString *)phone Add:(NSString *)add Andtime:(NSString *)time;
@end
