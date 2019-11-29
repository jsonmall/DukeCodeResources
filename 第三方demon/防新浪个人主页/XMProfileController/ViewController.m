//
//  ViewController.m
//  XMProfileController
//
//  Created by sfk-ios on 2018/4/27.
//  Copyright © 2018年 aiq西米. All rights reserved.
//

#import "ViewController.h"
#import "TestMeController.h"
#import "TestTableViewController.h"
#import "PhotosTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50, 150, 200, 80)];
    [btn setTitle:@"Modal the VC" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(showVc) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(50, 300, 200, 80)];
    [btn2 setTitle:@"Push the VC" forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor redColor];
    [btn2 addTarget:self action:@selector(pushVc) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    

    UISearchBar *searchBar = [[UISearchBar alloc]init];
    [self.view addSubview:searchBar];
}


// for modal方式
- (void)showVc
{
#warning 子控制器数组必须和标题数组数量一致 ChildViewControllers.count must eq titlesAarray.count
    // 设置子控制器，子控制器数组必须和标题数组数量一致,table子控制器需继承自 XMTableViewController
    TestMeController *meVc = [[TestMeController alloc]initWithChildViewControllerClasses:@[[TestTableViewController class],[TestTableViewController class],[PhotosTableViewController class]] theirTitles:@[@"主页",@"动态",@"相册"]];
    
    // 个性化设置分页tab子控制器菜单属性
    meVc.pageVc.titleColorSelected = [UIColor blackColor];
    meVc.pageVc.titleColorNormal = [UIColor grayColor];
    meVc.pageVc.menuBGColor = [UIColor groupTableViewBackgroundColor];
    meVc.pageVc.menuViewStyle = WMMenuViewStyleLine;
    meVc.pageVc.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
    meVc.pageVc.titleSizeSelected = 15;
    meVc.pageVc.titleSizeNormal = 13;
    meVc.pageVc.menuHeight = 40;
    meVc.pageVc.menuItemWidth = XMSCREEN_WIDTH /3;
    meVc.pageVc.progressColor = [UIColor orangeColor];
    meVc.pageVc.progressWidth = 25;
    meVc.pageVc.progressHeight = 2.4;
    meVc.pageVc.progressViewCornerRadius = 1.2;
    meVc.pageVc.progressViewBottomSpace = 2;
    meVc.pageVc.progressViewIsNaughty = YES;
    
    // modal方式
    meVc.isModal = YES;
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:meVc];
    [self presentViewController:nav animated:YES completion:nil];
}

// for push
- (void)pushVc
{
#warning 子控制器数组必须和标题数组数量一致 ChildViewControllers.count must eq titlesAarray.count
    // 设置子控制器，子控制器数组必须和标题数组数量一致,table子控制器需继承自 XMTableViewController
    TestMeController *meVc = [[TestMeController alloc]initWithChildViewControllerClasses:
                              @[[TestTableViewController class],
                                [TestTableViewController class],
                                [PhotosTableViewController class],
                                [TestTableViewController class]]
                                theirTitles:@[@"主页",@"动态",@"相册", @"私密"]];
    
    // 个性化设置分页tab子控制器菜单属性
    meVc.pageVc.titleColorSelected = [UIColor blackColor];
    meVc.pageVc.titleColorNormal = [UIColor grayColor];
    meVc.pageVc.menuBGColor = [UIColor groupTableViewBackgroundColor];
    meVc.pageVc.menuViewStyle = WMMenuViewStyleLine;
    meVc.pageVc.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
    meVc.pageVc.titleSizeSelected = 15;
    meVc.pageVc.titleSizeNormal = 13;
    meVc.pageVc.menuHeight = 40;
    meVc.pageVc.menuItemWidth = XMSCREEN_WIDTH /6;
    meVc.pageVc.progressColor = [UIColor orangeColor];
    meVc.pageVc.progressWidth = 25;
    meVc.pageVc.progressHeight = 2.4;
    meVc.pageVc.progressViewCornerRadius = 1.2;
    meVc.pageVc.progressViewBottomSpace = 2;
    meVc.pageVc.progressViewIsNaughty = YES;
    
    // Push 方式
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"";
    self.navigationItem.backBarButtonItem = backItem;
    self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
    [self.navigationController pushViewController:meVc animated:YES];
}


@end
