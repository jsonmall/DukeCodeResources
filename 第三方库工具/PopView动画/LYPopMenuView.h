//
//  LYPopMenuView.h
//  LYPopMenuView

#import "LYPopMenuViewDelegate.h"
#import "PopMenuButton.h"
#import "PopMenuModel.h"
#import <UIKit/UIKit.h>

/**
 *  弹出动画类型
 *
 */
typedef NS_ENUM(NSUInteger, LYPopMenuViewAnimationType) {
    /**
     *  仿新浪App弹出菜单。
     *
     */
    LYPopMenuViewAnimationTypeSina,
    /**
     *  带有粘性的动画
     *
     */
    LYPopMenuViewAnimationTypeViscous,
    /**
     *  底部中心点弹出动画
     *
     */
    LYPopMenuViewAnimationTypeCenter,
    
    /**
     *  左和右弹出动画
     *
     */
    LYPopMenuViewAnimationTypeLeftAndRight,
};

typedef enum : NSUInteger {
    /**
     *  light模糊背景类型。
     *
     */
    LYPopMenuViewBackgroundTypeLightBlur,

    /**
     *  dark模糊背景类型。
     *
     */
    LYPopMenuViewBackgroundTypeDarkBlur,

    /**
     *  偏白半透明背景类型。
     *
     */
    LYPopMenuViewBackgroundTypeLightTranslucent,

    /**
     *  偏黑半透明背景类型。
     *
     */
    LYPopMenuViewBackgroundTypeDarkTranslucent,

    /**
     *  白~黑渐变色。
     *
     */
    LYPopMenuViewBackgroundTypeGradient,

} LYPopMenuViewBackgroundType; //背景类型


@interface LYPopMenuView : UIView

/*=====================================================================================*/

@property (nonatomic, retain) NSArray<PopMenuModel*>* dataSource;

/**
 *  背景类型默认为 'LYPopMenuViewBackgroundTypeLightBlur'
 *
*/
@property (nonatomic, assign) LYPopMenuViewBackgroundType backgroundType;

/**
 *  动画类型
 *
 */
@property (nonatomic, assign) LYPopMenuViewAnimationType animationType;

/**
 *  自动识别颜色主题，默认为关闭。
 *
 */
@property (nonatomic, assign) BOOL automaticIdentificationColor;

/**
 *  LYPopMenuViewDelegate
 */
@property (nonatomic, assign) id<LYPopMenuViewDelegate> delegate;

/**
 *  默认为 10.0f         取值范围: 0.0f ~ 20.0f
 *  default is 10.0f    Range: 0 ~ 20
 */
@property (nonatomic, assign) CGFloat popMenuSpeed;

/**
 *  顶部自定义View
 */
@property (nonatomic, strong) UIView* topView;

+ (instancetype)sharedPopMenuManager;

- (void)openMenu;

- (void)closeMenu;

- (BOOL)isOpenMenu;

@end

UIKIT_EXTERN NSString* const LYPopMenuViewWillShowNotification;
UIKIT_EXTERN NSString* const LYPopMenuViewDidShowNotification;
UIKIT_EXTERN NSString* const LYPopMenuViewWillHideNotification;
UIKIT_EXTERN NSString* const LYPopMenuViewDidHideNotification;
