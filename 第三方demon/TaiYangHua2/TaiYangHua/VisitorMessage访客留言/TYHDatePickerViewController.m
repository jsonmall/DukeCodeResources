//
//  TYHDatePickerViewController.m
//  TaiYangHua
//
//  Created by HHLY on 15/12/24.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import "TYHDatePickerViewController.h"
#import "UIImage+CH.h"
#import "JMDatePickerView.h"
#import "Calender.h"
#import "TYHTimeTools.h"

@interface TYHDatePickerViewController ()
{
    JMDatePickerView *_startPickerView;
    JMDatePickerView *_endPickerView;
}

@property (nonatomic, strong) UIButton *rightBtn;

@end

@implementation TYHDatePickerViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = colorf0fGrey;//XWColorRGBA(240.0, 240.0, 240.0, 1);
    [self setBackView];
    [self setTitleView];
    
    [self addPickerView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = YES;
    
    [self setRightView];
    [MobClick beginLogPageView:@"TYHDatePickerViewController"];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.rightBtn removeFromSuperview];
    [MobClick endLogPageView:@"TYHDatePickerViewController"];
}

#pragma mark -- init nav view
- (void)addPickerView
{
//    Calender *calender = [[Calender alloc] initWithDate:[NSDate date]];
    _startPickerView = [[JMDatePickerView alloc] initWithFrame:CGRectMake(0, 79, SCREEN_W, 178) title:Localizable(@"起始时间") imageName:@"startTimeImage"];
    [_startPickerView setCurrentSeleted:[TYHTimeTools yearWithDateStr:self.startDateString] month:[TYHTimeTools monthWithDateStr:self.startDateString] day:[TYHTimeTools dayWithDateStr:self.startDateString]];
    [self.view addSubview:_startPickerView];

    _endPickerView   = [[JMDatePickerView alloc] initWithFrame:CGRectMake(0, 272, SCREEN_W, 178) title:Localizable(@"截止时间") imageName:@"endTimeImage"];
    [_endPickerView setCurrentSeleted:[TYHTimeTools yearWithDateStr:self.endDateString] month:[TYHTimeTools monthWithDateStr:self.endDateString] day:[TYHTimeTools dayWithDateStr:self.endDateString]];
    [self.view addSubview:_endPickerView];
}

- (void)setBackView
{
    UIBarButtonItem *leftBarBtnItem       = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backImage"]
                                                                       style:UIBarButtonItemStyleBordered
                                                                      target:self
                                                                      action:@selector(clickBackBarItem)];

    leftBarBtnItem.tintColor              = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftBarBtnItem;
}

- (void)setTitleView
{
    UILabel *titleLabel           = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W / 2.0, 32)];
    titleLabel.textAlignment      = NSTextAlignmentCenter;

    titleLabel.textColor          = [UIColor whiteColor];
    titleLabel.text               = Localizable(@"日期选择");
    [titleLabel setFont:fontSize36];
    self.navigationItem.titleView = titleLabel;
}

- (void)setRightView
{
    self.rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_W - 63, (self.navigationController.navigationBar.height - 22) / 2.0f, 46.0f, 22.0f)];
    [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"sureDefaultImage"] forState:UIControlStateNormal];
    
    [self.rightBtn setTitle:Localizable(@"确定") forState:UIControlStateNormal];
    [self.rightBtn.titleLabel setFont:fontSize24];
    [self.rightBtn setTitleColor:color227shallblue forState:UIControlStateNormal];
    
    [self.navigationController.navigationBar addSubview: self.rightBtn];
    
    [self.rightBtn addTarget:self action:@selector(clickSureBtn:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- click nav item
- (void)clickBackBarItem
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)clickSureBtn:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
//    NSLog(@"start time:%@,end time:%@", _startPickerView.resultDateString, _endPickerView.resultDateString);
    self.pickerBlock(_startPickerView.resultDateString, _endPickerView.resultDateString);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
