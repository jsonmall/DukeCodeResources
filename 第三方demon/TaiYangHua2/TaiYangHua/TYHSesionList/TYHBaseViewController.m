//
//  TYHBaseViewController.m
//  TaiYangHua
//
//  Created by Vieene on 15/12/28.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import "TYHBaseViewController.h"

@interface TYHBaseViewController ()

@end

@implementation TYHBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIBarButtonItem *leftBarBtnItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backImage"]
//                                                                       style:UIBarButtonItemStyleBordered
//                                                                      target:self
//                                                                      action:@selector(clickBackBarItem)];
    UIButton *btn = [[UIButton alloc] init];
    [btn addTarget:self action:@selector(clickBackBarItem) forControlEvents:UIControlEventTouchDown];
    [btn setImage:[UIImage imageNamed:@"backImage"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 50, 40);
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, -40, 0, 0);
//    btn.backgroundColor = [UIColor redColor];
    UIBarButtonItem *baritem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    btn.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = baritem;
    
    UIColor * color = [UIColor whiteColor];
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
}


- (void)clickBackBarItem
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
