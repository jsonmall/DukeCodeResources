//
//  ChongZhiController.h
//  夺宝吧
//
//  Created by xiaocai on 15/11/27.
//  Copyright © 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "orderModel.h"
#import "PayInfoModel.h"



@interface ChongZhiController : UIViewController

//支付模型 总共四个
//支付宝
@property (nonatomic , strong) PayInfoModel *zfbModel;
//iapppay微信
@property (nonatomic , strong) PayInfoModel *iapppayWXModel;
//iapppay支付宝
@property (nonatomic , strong) PayInfoModel *iapppayzfbModel;
//pingpp京东
@property (nonatomic , strong) PayInfoModel *pingppJDModel;

//配置模型
@property (nonatomic , strong) NSDictionary *peizhiDic;
//支付提交的模型
@property (nonatomic , strong)orderModel *ordermodel;

//tableView
@property (weak, nonatomic) IBOutlet UITableView *cusTableView;
//头部view
@property (weak, nonatomic) IBOutlet UIView *headerView;
//用户名Label
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
//显示夺宝币数量
@property (weak, nonatomic) IBOutlet UILabel *duobiLabel;
//显示 用户积分
@property (weak, nonatomic) IBOutlet UILabel *jifenLabel;
//头像Outlet
@property (weak ,nonatomic) IBOutlet UIButton *touxiangButton;
//imageView
@property (weak ,nonatomic) IBOutlet UIImageView *backImage;
#pragma mark -- 支付选项是否打开
//支付宝原生的是否可用
@property (nonatomic , assign) BOOL is_alipay_mobile;
//iapppay微信是否可用
@property (nonatomic , assign) BOOL is_iapppay_wx;
//iapppay支付宝是否可用
@property (nonatomic , assign) BOOL is_iapppay_zfb;
//京东支付是否可用
@property (nonatomic , assign) BOOL is_pingpp_jd;
//返回按钮
- (IBAction)backBtnClick:(UIButton *)sender;
//用户头像点击 
- (IBAction)touxiangBtnClick:(UIButton *)sender;


- (IBAction)tijiaoBtnClick:(UIButton *)sender;

@end
