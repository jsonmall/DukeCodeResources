//
//  PopMenuButton.h
//  LYPopMenuView


#import "LYPopMenuView.h"
#import <UIKit/UIKit.h>

typedef void (^completionAnimation)();

@interface PopMenuButton : UIButton

@property (nonatomic, nonnull, strong) PopMenuModel* model;

@property (nonatomic, nonnull, strong) completionAnimation block;

- (instancetype __nonnull)init;
- (void)selectdAnimation;
- (void)cancelAnimation;

@end
