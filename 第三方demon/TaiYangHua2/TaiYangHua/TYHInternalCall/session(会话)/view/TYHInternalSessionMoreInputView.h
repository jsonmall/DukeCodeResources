//
//  TYHInternalSessionMoreInputView.h
//  TaiYangHua
//
//  Created by Lc on 16/1/26.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TYHInternalSessionMoreInputView;

@protocol TYHInternalSessionMoreInputViewDelegate <NSObject>

@required

- (void)internalSessionMoreInputView:(TYHInternalSessionMoreInputView *)internalSessionMoreInputView didFinishChosseImage:(UIImage *)selectedImage thumbnailFrme:(CGSize)thumbnailFrme;

@end
@interface TYHInternalSessionMoreInputView : UIView

@property (weak, nonatomic) id<TYHInternalSessionMoreInputViewDelegate> delegate;

@end
