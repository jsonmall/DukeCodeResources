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

- (void)internalSessionMoreInputView:(TYHInternalSessionMoreInputView *)internalSessionMoreInputView didFinishChooseImageLocalPath:(NSString *)imageLocalPath thumbnailFrame:(CGSize)thumbnailFrame fileName:(NSString *)fileName;

@end
@interface TYHInternalSessionMoreInputView : UIView

@property (weak, nonatomic) id<TYHInternalSessionMoreInputViewDelegate> delegate;

@end
