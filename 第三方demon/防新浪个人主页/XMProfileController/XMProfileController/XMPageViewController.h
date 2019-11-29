//
//  XMPageViewController.h
//  XMProfileDemo
//
//  Created by sfk-ios on 2018/4/26.
//  Copyright © 2018年 aiq西米. All rights reserved.
//

#import "WMPageController.h"
#import "XMTableViewController.h"

@protocol XMPageViewControllerDelegate <NSObject>

@optional
- (void)childTableView:(UITableView *)tableView didScrollOffsetY:(CGFloat)offsetY;

@end

@interface XMPageViewController : WMPageController
@property (weak, nonatomic) id<XMPageViewControllerDelegate> tableDelegate;
/// 是否可以切换子控制器
@property (assign, nonatomic) BOOL shouChangeChildVc;
@end
