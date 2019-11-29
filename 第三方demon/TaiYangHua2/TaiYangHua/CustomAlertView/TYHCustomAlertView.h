//
//  TYHCustomAlertView.h
//  TaiYangHua
//
//  Created by Vieene on 16/1/20.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TYHCustomAlertView;
typedef void (^onButtonTouchUpInside)(TYHCustomAlertView *alertView, int buttonIndex);

@interface TYHCustomAlertView : UIView

@property (nonatomic,copy)onButtonTouchUpInside block;


- (void)show;


//两个长条按钮的弹框
-(instancetype)initStyleWithMessage:(NSString *)message buttonTitle1:(NSString *)title1 buttonTitle2:(NSString *)title2 andBlock:(onButtonTouchUpInside )block;

//两个按钮的弹框 和提示语的弹框
-(instancetype)initStyleWithMessage:(NSString *)message tipsMsg:(NSString *)tipsMsg buttonTitle1:(NSString *)title1 buttonTitle2:(NSString *)title2 andBlock:(onButtonTouchUpInside )block;
@end
