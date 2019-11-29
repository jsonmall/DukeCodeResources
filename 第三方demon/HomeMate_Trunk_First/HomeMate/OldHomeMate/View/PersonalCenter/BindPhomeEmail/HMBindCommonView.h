//
//  HMBindCommonView.h
//  HomeMate
//
//  Created by orvibo on 15/8/14.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TipRedColor     RGB(232, 77, 37)
#define TipNormalColor  RGB(229, 229, 229)
#define TipBottomTag    150



@protocol HMBindCommonViewDelegate;

@interface HMBindCommonView : UIView

/**
 *  显示内容为：顶部有提示语、TextField、TextField底部提示语、Next按钮，（也可以是验证码页面）
 *
 *  @param frame
 *  @param isEmail      YES：邮箱界面， NO：手机界面
 *  @param bind         YES:绑定过     NO：没绑定手机或邮箱
 *  @param verificationCode YES:验证码页面  NO：非验证码页面
 *  @param topTipStr    TextField上方的提示语
 *  @param bottomTipStr TextField下面的提示语,没有填写nil
 *  @param oldNumberStr 旧的绑定的手机号或邮箱，没有填写nil
 *  @param delegate
 *
 *  @return 
 */
-(instancetype)initWithFrame:(CGRect)frame
                       email:(BOOL)isEmail
                        bind:(BOOL)isBind
            verificationCode:(BOOL)isverificationCode
                   topTipStr:(NSString *)topTipStr
                bottomTipStr:(NSString *)bottomTipStr
                oldNumberStr:(NSString *)oldNumberStr
                    delegate:(id<HMBindCommonViewDelegate>)delegate;

/**
 *  开始倒计时
 */
-(void)startTimer;

/**
 *  结束倒计时
 */
-(void)stopTimer;

/**
 *  显示textField底部的提示语,重复会移除原来的，然后初始化新的视图
 *
 *  @param tip
 *  @param isRed 颜色
 */
-(void)showErrorTip:(NSString *)tip isRedColor:(BOOL)isRed;

/**
 *  删除textField底部的提示语
 */
-(void)hideErrorTip;

/**
 *  textField红框显示
 */
-(void)showTextFieldError;
-(void)hideTextFieldError;

-(void)setClickCountdownBtn:(BOOL)isClick;


@end


@protocol HMBindCommonViewDelegate <NSObject>

/**
 *  下一步按钮
 *  @param text TextField输入的邮箱或手机号
 */
-(void)clickBindCommonViewNextButtonEnterText:(NSString *)text;

@optional
/**
 *  点击倒计时按钮
 */
-(void)clickCountdownbutton;

@end
















