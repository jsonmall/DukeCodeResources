//
//  ShowPrizeVC.m
//  夺宝吧
//
//  Created by xiaocai on 15/7/29.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "ShowPrizeVC.h"
#import "GetImgsView.h"
#import "TiShiView.h"
#import "NoDataView.h"
@interface ShowPrizeVC ()
{
    GetImgsView *getView;
}
@end

@implementation ShowPrizeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadCustomNaviBar];

    getView = [[[NSBundle mainBundle]loadNibNamed:@"GetImgsView" owner:self options:nil] lastObject];
    getView.model = self.model;
    getView.father =self;
    getView.frame = CGRectMake(0, 64, WYMWITH, getView.frame.size.height*AUTOY);
    [self.view addSubview:getView];
    
    TiShiView *tishi = [[[NSBundle mainBundle]loadNibNamed:@"TiShiView" owner:self options:nil] lastObject];
    tishi.frame = CGRectMake(0, 0, WYMWITH, WYMHEIGHT);
    tishi.father = self;
    [self.view addSubview:tishi];
}
//加载导航条
- (void)loadCustomNaviBar
{
    UIView *naviBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WYMWITH, 20+44)];
    naviBar.backgroundColor = QBB_RED_COLOR;
    //返回按钮
    PublicBackBtn *backBtn = [[PublicBackBtn alloc]initWithVC:self andBackType:pop Img:[UIImage imageNamed:@"icon_back_white_press"]];
    [naviBar addSubview:backBtn];
    //标题
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 25)];
    titleLab.center = CGPointMake(WYMWITH/2, 42);
    titleLab.text = @"我要晒单";
    titleLab.font = [UIFont systemFontOfSize:TITLE_SIZE];
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.textColor = [UIColor whiteColor];
    //分割线
    UILabel *fenge = [[UILabel alloc]initWithFrame:CGRectMake(0, 63.5, WYMWITH, 0.5)];
    fenge.backgroundColor = [UIColor lightGrayColor];
    [naviBar addSubview:fenge];
    [naviBar addSubview:titleLab];
    [self.view addSubview:naviBar];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidDisappear:(BOOL)animated
{
    [WYPublic removeHudToWindow];
}

@end
