//
//  ViewController.m
//  自定义导航栏
//
//  Created by 郭鹏 on 16/5/16.
//  Copyright © 2016年 郭鹏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =[UIColor whiteColor];
    NSDictionary *dic = [[NSDictionary alloc] initWithObjects:@[@"终点站",@"前一页",[UIColor darkGrayColor],@"下一页"] forKeys:@[Navi_Title,Navi_LeftTitle,Navi_BarBackgroundColor,Navi_RightTitle]];
    [self customizeNaviBarForDictionary:dic barType:navi_LeftTitle_RightTitle];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self navigationCanDragBack:YES];
    
}
-(void)rightBtnClick:(UIButton *)click
{
    NSLog(@"rightBlick");
}
-(void)leftBtnClick:(UIButton *)click
{
    NSLog(@"leftBlick");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
