//
//  OwnerCellTableViewCell.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/2.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OwnerModel.h"
@interface OwnerCellTableViewCell : UITableViewCell
//填充cell的方法
- (void)fillCellWithModel:(OwnerModel *)model;
@end
