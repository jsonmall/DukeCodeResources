//
//  TYHInternalAssetGridCell.h
//  TaiYangHua
//
//  Created by Lc on 16/2/15.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TYHInternalAssetGridCell, TYHInternalAsset;

@protocol TYHInternalAssetGridCellDelegate <NSObject>

@required

- (void)internalAssetGridCell:(TYHInternalAssetGridCell *)internalAssetGridCell didClickButton:(UIButton *)currentButton;

@end

@interface TYHInternalAssetGridCell : UICollectionViewCell

@property (weak, nonatomic) id<TYHInternalAssetGridCellDelegate> delegate;

@property (strong, nonatomic) TYHInternalAsset *internalAsset;

@end
