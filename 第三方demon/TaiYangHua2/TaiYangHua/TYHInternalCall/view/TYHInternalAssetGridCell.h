//
//  TYHInternalAssetGridCell.h
//  TaiYangHua
//
//  Created by Lc on 16/2/15.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef void (^currentSeletedCount)(BOOL);

@class TYHInternalAssetGridCell, TYHInternalAsset;

@protocol TYHInternalAssetGridCellDelegate <NSObject>

@required

- (void)internalAssetGridCell:(TYHInternalAssetGridCell *)internalAssetGridCell isSelected:(BOOL)selected isNeedToAdd: (void (^)(BOOL add))add;

@end

@interface TYHInternalAssetGridCell : UICollectionViewCell

@property (weak, nonatomic) id<TYHInternalAssetGridCellDelegate> delegate;
@property (strong, nonatomic) TYHInternalAsset *internalAsset;
//@property (copy, nonatomic) void (^currentSeletedCount)(BOOL add);
@end
