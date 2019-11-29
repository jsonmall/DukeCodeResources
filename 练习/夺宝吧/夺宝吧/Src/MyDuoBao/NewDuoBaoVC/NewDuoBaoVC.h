//
//  NewDuoBaoVC.h
//  夺宝吧
//
//  Created by xiaocai on 15/12/18.
//  Copyright © 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingModel.h"

@interface NewDuoBaoVC : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *userImageBtn;

@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *duobiLabel;

@property (weak, nonatomic) IBOutlet UILabel *jifenLabel;

@property (weak, nonatomic) IBOutlet UIButton *rechargeBtn;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;


//用户头像点击事件
- (IBAction)userImageClick:(UIButton *)sender;

//登录按钮
- (IBAction)loginBtnClick:(UIButton *)sender;

//充值点击事件
- (IBAction)rechargeBtnClick:(UIButton *)sender;



@property (nonatomic , strong) NSMutableArray<SettingModel*> *data;

@property (nonatomic , strong) UITableView *cusTableView;

+ (instancetype)shareMyDuoBaoVC;

@end
