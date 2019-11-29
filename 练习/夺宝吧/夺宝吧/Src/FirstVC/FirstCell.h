//
//  FirstCell.h
//  夺宝吧
//
//  Created by xiaocai on 15/6/15.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductModel.h"
#import "FirstVC.h"
@interface FirstCell : UICollectionViewCell
//所在collectionview
@property (nonatomic,weak)UICollectionView *cltView;
//填充数据的方法
- (void)fillCellWithModel:(ProductModel *)model;
@end
