//
//  GetImgsView.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/29.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RewardModel.h"
#import "ShowPrizeVC.h"
@interface GetImgsView : UIView
@property (nonatomic,weak)ShowPrizeVC *father;
@property (nonatomic,strong)RewardModel *model;
@end
