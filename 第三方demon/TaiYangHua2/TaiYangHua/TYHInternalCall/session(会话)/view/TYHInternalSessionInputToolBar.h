//
//  TYHInternalSessionInputToolBar.h
//  TaiYangHua
//
//  Created by Lc on 16/1/22.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TYHInternalSessionInputToolBar;

@protocol TYHInternalSessionToolBarDelegate <NSObject>

@required

- (void)internalSessionInputToolBar:(TYHInternalSessionInputToolBar *)internalSessionInputToolBar didSendText:(NSAttributedString *)text;

- (void)internalSessionInputToolBar:(TYHInternalSessionInputToolBar *)internalSessionInputToolBar didSendVoice:(NSString *)recordPath duration:(NSInteger) duration;

- (void)internalSessionInputToolBar:(TYHInternalSessionInputToolBar *)internalSessionInputToolBar didSendImage:(UIImage *)selectedImage thumbnailFrme:(CGSize)thumbnailFrme;

@end

@interface TYHInternalSessionInputToolBar : UIView

+ (instancetype)internalSessionInputToolBar;

@property (nonatomic, assign) BOOL switchingKeybaord;

@property (weak, nonatomic) id<TYHInternalSessionToolBarDelegate> delegate;

@end
