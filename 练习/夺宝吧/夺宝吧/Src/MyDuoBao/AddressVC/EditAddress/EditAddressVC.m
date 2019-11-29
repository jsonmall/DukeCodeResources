//
//  EditAddressVC.m
//  夺宝吧
//
//  Created by xiaocai on 15/7/23.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "EditAddressVC.h"
#import "EditAddressView.h"
@interface EditAddressVC ()
{
    EditAddressView *editAddressView;
    //记录默认信息
    NSString *_name;
    NSString *_phone;
    NSString *_address;
    NSString *_detail;
    NSString *_sheng;
    NSString *_shi;
    NSString *_xian;
}
@end

@implementation EditAddressVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = QBB_GRAY_COLOR;
    [self loadCustomNaviBar];
    
    editAddressView = [[[NSBundle mainBundle]loadNibNamed:@"EditAddressView" owner:self options:nil]lastObject];
    editAddressView.frame = CGRectMake(0, 64, WYMWITH, editAddressView.frame.size.height);
    editAddressView.father = self;
    [self.view addSubview:editAddressView];
    [editAddressView MorenInfoWitnName:_name Phone:_phone Address:_address Detail:_detail Sheng:_sheng Shi:_shi Xian:_xian];
    //屏蔽键盘事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeKeyBoard)];
    [self.view addGestureRecognizer:tap];
}
//关闭键盘
- (void)closeKeyBoard
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
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
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 25)];
    titleLab.center = CGPointMake(WYMWITH/2, 42);
    titleLab.text = @"编辑收货地址";
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
//默认信息
- (void)MorenInfoWitnName:(NSString *)name Phone:(NSString *)phone Address:(NSString *)address Detail:(NSString *)detail Sheng:(NSString *)sheng Shi:(NSString *)shi Xian:(NSString *)xian
{
    _name = name;
    _phone = phone;
    _address = address;
    _detail = detail;
    _sheng = sheng;
    _xian = xian;
    _shi = shi;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
