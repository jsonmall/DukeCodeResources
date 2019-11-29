//
//  ShowTimeCell.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/28.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowOrderModel.h"
@interface ShowTimeCell : UITableViewCell
//是否商品详情里面中奖记录标志
@property (nonatomic,assign)BOOL isDetailFlag;
- (void)fillCellWithModel:(ShowOrderModel *)model;
@end
