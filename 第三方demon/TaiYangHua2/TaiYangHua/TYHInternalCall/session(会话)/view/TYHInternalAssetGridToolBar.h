//
//  TYHInternalAssetGridToolBar.h
//  TaiYangHua
//
//  Created by Lc on 16/2/17.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TYHInternalAssetGridToolBar;

@protocol TYHInternalAssetGridToolBarDelegate <NSObject>

@required

- (void)didClickPreviewInAssetGridToolBar:(TYHInternalAssetGridToolBar *)internalAssetGridToolBar;
- (void)didClickSenderButtonInAssetGridToolBar:(TYHInternalAssetGridToolBar *)internalAssetGridToolBar;

@end

@interface TYHInternalAssetGridToolBar : UIView

@property (strong, nonatomic) NSMutableArray *selectedItems;

@property (weak, nonatomic) id<TYHInternalAssetGridToolBarDelegate> delegate;

@end
