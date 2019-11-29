//
//  UINavigationBar+Awesome.h
//  LTNavigationBar
//
//  Created by ltebean on 15-2-15.
//  Copyright (c) 2015 ltebean. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 屏幕判断相关
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define XMSCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define XMSCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define XMSCREEN_MAX_LENGTH (MAX(XMSCREEN_WIDTH, XMSCREEN_HEIGHT))
#define XMSCREEN_MIN_LENGTH (MIN(XMSCREEN_WIDTH, XMSCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && XMSCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && XMSCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && XMSCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && XMSCREEN_MAX_LENGTH == 736.0)
#define IS_IPHONE_X (IS_IPHONE && XMSCREEN_MAX_LENGTH == 812.0)

@interface UINavigationBar (Awesome)
- (void)lt_setBackgroundColor:(UIColor *)backgroundColor;
- (void)lt_setElementsAlpha:(CGFloat)alpha;
- (void)lt_setTranslationY:(CGFloat)translationY;
- (void)lt_reset;
@end
