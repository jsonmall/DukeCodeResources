//
//  DetailCell.h
//  夺宝吧
//
//  Created by xiaocai on 15/6/30.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecordModel.h"
@interface DetailCell : UITableViewCell
//填充cell的方法
- (void)fillCellWithModel:(RecordModel *)model;
@end
