//
//  WYAlertView.h
//  WYAltView
//
//  Created by 王琰 on 14/12/17.
//  Copyright (c) 2014年 王琰. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void ((^TLCompletionBlock)());
@interface WYAlertView : UIView
//添加自定义的init方法
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message inView:(UIView *)view cancelButtonTitle:(NSString *)cancelButton confirmButton:(NSString *)confirmButton;
//获取实例的类方法
+ (instancetype)showInView:(UIView *)view withTitle:(NSString *)title message:(NSString *)message confirmButtonTitle:(NSString *)confirm cancelButtonTitle:(NSString *)cancel;
//确定，取消按钮的回调方法
- (void)handleCancel:(TLCompletionBlock)cancelBlock handleConfirm:(TLCompletionBlock)confirmBlock;
//展示
- (void)show;
@end
