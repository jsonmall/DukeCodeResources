//
//  HisNumCell.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/6.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HisNumModel.h"
@interface HisNumCell : UICollectionViewCell
- (void)fillCellWithModel:(HisNumModel *)model;
- (void)fillCellWithTitle:(NSString*)title isRedColor:(BOOL)isRed;
@end
