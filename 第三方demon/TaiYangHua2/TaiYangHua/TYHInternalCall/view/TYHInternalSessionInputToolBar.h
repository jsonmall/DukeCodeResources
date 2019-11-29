//
//  TYHInternalSessionInputToolBar.h
//  TaiYangHua
//
//  Created by Lc on 16/1/22.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TYHInternalSessionInputToolBar, TYHInternalSession;

@protocol TYHInternalSessionToolBarDelegate <NSObject>

@required

- (void)internalSessionInputToolBar:(TYHInternalSessionInputToolBar *)internalSessionInputToolBar didSendTextSession:(TYHInternalSession *)textSession isNeedToAdd:(BOOL)add;

- (void)internalSessionInputToolBar:(TYHInternalSessionInputToolBar *)internalSessionInputToolBar didSendVoiceSession:(TYHInternalSession *)voiceSession isNeedToAdd:(BOOL)add;

- (void)internalSessionInputToolBar:(TYHInternalSessionInputToolBar *)internalSessionInputToolBar didSendImageSession:(TYHInternalSession *)imageSession isNeedToAdd:(BOOL)add;

- (void)internalSessionInputToolBarDidStartRecord:(TYHInternalSessionInputToolBar *)internalSessionInputToolBar;
- (void)internalSessionInputToolBarDidEndRecord:(TYHInternalSessionInputToolBar *)internalSessionInputToolBar;
@end

@interface TYHInternalSessionInputToolBar : UIView

+ (instancetype)internalSessionInputToolBar;

@property (assign, nonatomic) BOOL switchingKeybaord;

/**
 *  会话标志
 */
@property (assign, nonatomic) NSInteger targetType;

/**
 *  会话ID
 */
@property (copy, nonatomic) NSString *sessionId;

/**
 *  目标对象ID
 */
@property (copy, nonatomic) NSString *targetId;


@property (copy, nonatomic) void (^inputBarHeight)(CGFloat height);

@property (weak, nonatomic) id<TYHInternalSessionToolBarDelegate> delegate;

@end
