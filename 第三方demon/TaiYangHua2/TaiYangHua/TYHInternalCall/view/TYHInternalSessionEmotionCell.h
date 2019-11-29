//
//  TYHInternalSessionEmotionCell.h
//  TaiYangHua
//
//  Created by Lc on 16/1/29.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TYHInternalSessionEmotionCell, TYHEmotion;
@protocol TYHInternalSessionEmotionCellDelegate <NSObject>

@required
- (void)internalSessionEmotionCell:(TYHInternalSessionEmotionCell *)internalSessionEmotionCell didClickEmotion:(TYHEmotion *)emotion;

@end

@interface TYHInternalSessionEmotionCell : UICollectionViewCell

@property (strong, nonatomic) NSArray *emotions;
@property (weak, nonatomic) id<TYHInternalSessionEmotionCellDelegate> delegate;
@end


