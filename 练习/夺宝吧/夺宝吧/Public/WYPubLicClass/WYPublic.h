//
//  WYPublic.h
//  夺宝吧
//
//  Created by xiaocai on 15/6/18.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//#import "MBProgressHUD.h"
#import "SVProgressHUD.h"

@interface WYPublic : NSObject
//做适配创建frame的方法
+ (CGRect)getRectWithX:(CGFloat)x :(CGFloat) y :(CGFloat)width :(CGFloat)height;
//判断用户是否登录，没有则跳转到登陆界面
+ (BOOL)ifUserHaveLogin;
//用MBProgressHUD提示做弱提示
//+ (void)showMessageWithTitle:(NSString *)title Msg:(NSString *)message view:(UIView*)view completion:(void(^)(void))completion;
//用户提示信息
+ (void)showMessageWithTitle:(NSString *)title Msg:(NSString *)message;
//用户提示错误信息
+ (void)showErrorWithTitle:(NSString*)title Msg:(NSString*)message;
//判断输入信息是否是邮箱
+ (BOOL)iseMailAddress:(NSString *)candidate;
//判断输入信息是否是手机号
+ (BOOL)isPhoneNum:(NSString *)candidate;
//给window添加一个遮罩层
+ (void)addZheZhaoToWindowWithTitle:(NSString *)title;
//去掉window的遮罩
+ (void)removeZheZhaoToWindow;

//给window添加加载提示hud
+ (void)addHudToWindow;
//用文字特例化一个hud
+ (void)addHudToWindowWithTitle:(NSString *)title;
//去掉加载提示
+ (void)removeHudToWindow;
//返回到登录注册以前的界面
+ (void)logOrRegistSuccess;
//获取一条横着的分割线
+ (UIView *)getFenGexian:(CGFloat)x :(CGFloat)y :(CGFloat)width :(CGFloat)height;
//获取中间红两边灰的字符串
+ (NSMutableAttributedString *)getRedMiddleStrWithLeft:(NSString *)leftStr Middle:(NSString*)middleStr RightStr:(NSString*)rightStr Font:(CGFloat)font;
//获取当前控制器
+(UIViewController *)GetCurrentviewController;
//判断是否为nsnull
+(NSString *)getUsefullStr:(id)str;
//获取一条 横线
+(UIView *)getLineView:(CGFloat)x orginY:(CGFloat)y sizeWidth:(CGFloat)width sizeHeight:(CGFloat)height;
//从storybaord上初始化一个controller
+ (UIViewController *)controllerWithStoryBoardName:(NSString*)storyBoardName identifier:(NSString*)identifier;
@end
