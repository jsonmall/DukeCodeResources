//
//  XMPageViewController.m
//  XMProfileDemo
//
//  Created by sfk-ios on 2018/4/26.
//  Copyright © 2018年 aiq西米. All rights reserved.
//

#import "XMPageViewController.h"

@interface XMPageViewController ()<XMTableViewControllerDelegate>

@end

@implementation XMPageViewController


- (void)viewDidLoad {
    [super viewDidLoad];

}

// 即将进入子控制器
- (void)pageController:(WMPageController *)pageController willEnterViewController:(nonnull __kindof UIViewController *)viewController withInfo:(nonnull NSDictionary *)info
{
    XMTableViewController *vc = viewController;
    vc.delegate = self;
    self.shouChangeChildVc = NO;
}

// 已进入子控制器
- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info
{
    self.shouChangeChildVc = YES;
}

// 子控制tableView 滚动
- (void)tableView:(UITableView *)tableView didScrollOffsetY:(CGFloat)offsetY
{
    if ([self.tableDelegate respondsToSelector:@selector(childTableView:didScrollOffsetY:)]) {
        [self.tableDelegate childTableView:tableView didScrollOffsetY:offsetY];
    }
}


@end
