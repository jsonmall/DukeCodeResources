//
//  XMProfileController.h
//  XMProfileController
//
//  Created by sfk-ios on 2018/4/27.
//  Copyright © 2018年 aiq西米. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+XMExtension.h"
#import "UINavigationBar+Awesome.h"
#import "XMPageViewController.h"

#define XM_NavbarH (IS_IPHONE_X?88:64)  // 导航栏+状态栏 高度
#define XM_HeaderH 150   // 头部内容高度，即进入页面时可视的头部高度

@class XMScrollView;

@interface XMProfileController : UIViewController
// 分页控制器
@property (strong, nonatomic) XMPageViewController *pageVc;
/// 是否modal方式
@property (assign, nonatomic) BOOL isModal;

/// 头部背景图
@property (weak, nonatomic) UIImageView *headerImageView;
/// 头部内容
@property (weak, nonatomic) UIView *headerView;
/// titleView
@property (weak, nonatomic) UILabel *titleLabel;

- (instancetype)initWithChildViewControllerClasses:(NSArray *)childsClasses theirTitles:(NSArray *)titles;

@end
