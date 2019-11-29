//
//  RewardsCell.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/21.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RewardModel.h"
@interface RewardsCell : UITableViewCell
//是否是自己的标志
@property (nonatomic,assign)BOOL isMineFlag;
- (void)fillCellWithModel:(RewardModel *)model;
@end
