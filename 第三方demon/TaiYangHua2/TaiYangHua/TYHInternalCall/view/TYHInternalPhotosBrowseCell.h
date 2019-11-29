//
//  TYHInternalPhotosBrowseCell.h
//  TaiYangHua
//
//  Created by Lc on 16/3/9.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "TYHInternalAssetCell.h"
@class TYHInternalSession, TYHInternalPhotosBrowseCell;
@protocol TYHInternalPhotosBrowseCellDelegate <NSObject>

@required
- (void)internalPhotosBrowseCellEndZooming:(TYHInternalPhotosBrowseCell *)photoBrowseCell;

@end


@interface TYHInternalPhotosBrowseCell : UICollectionViewCell

@property (strong, nonatomic) TYHInternalSession *internalSession;
@property (weak, nonatomic) id<TYHInternalPhotosBrowseCellDelegate> delegate;
@end
