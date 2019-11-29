//
//  NewDuoBaoController.h
//  夺宝吧
//
//  Created by xiaocai on 15/12/11.
//  Copyright © 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewDuoBaoController : UITableViewController

//tableView 的数据源
@property (nonatomic , strong) NSMutableArray *data;

#pragma  mark -- 与controller相连的控件
@property (nonatomic , weak) IBOutlet UIView *cusHeaderView;


@property (nonatomic , weak) IBOutlet UILabel *userNameLabel;


@property (nonatomic , weak) IBOutlet UILabel *duobiLabel;

@property (nonatomic , weak) IBOutlet UILabel *jifenLabel;

@property (nonatomic , weak) IBOutlet UIButton *imageBtn;

@property (nonatomic , weak) IBOutlet UIButton *loginBtn;

@property (nonatomic , weak) IBOutlet UIButton *rechargeBtn;

//点击头像的动作
- (IBAction)imageClick:(UIButton*)sender;
//点击登录的动作
- (IBAction)loginBtnClick:(UIButton*)sender;
//点击充值的动作
- (IBAction)rechargeBtnClick:(UIButton*)sender;
//点击设置的动作
- (IBAction)settingBtnClick:(UIButton*)sender;


@end
