//
//  ShowDetailVC.h
//  夺宝吧
//
//  Created by xiaocai on 15/8/3.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowOrderModel.h"

@interface ShowDetailVC : UIViewController
@property(nonatomic,strong)ShowOrderModel *model;

// 晒单id
@property(nonatomic,strong)NSString *sd_id;
// 晒单标题
@property(nonatomic,strong)NSString *sd_title;
// 用户uid
@property(nonatomic,strong)NSString *sd_uid;
// 用户名
@property(nonatomic,strong)NSString *sd_username;
// 晒单时间
@property(nonatomic,strong)NSString *sd_time;
// 商品id
@property(nonatomic,strong)NSString *sd_pdc_id;
// 同一商品ID
@property(nonatomic,strong)NSString *sd_pdc_sid;
// 期数
@property(nonatomic,strong)NSString *sd_pdc_qishu;
// 商品标题
@property(nonatomic,strong)NSString *sd_pdc_title;
// 中奖码
@property(nonatomic,strong)NSString *sd_code;
// 揭晓倒计时结束时间
@property(nonatomic,strong)NSString *sd_pdc_end_time;
// 是否虚拟商品 {0: 否, 1: 是}
@property(nonatomic,strong)NSString *sd_is_virtual;
// 虚拟商品充值类型 {0: 未知, 1: qq号, 2: 手机号, 3: 支付宝帐号}
@property(nonatomic,strong)NSString *sd_virtual_recharge_type;
// 物流公司
@property(nonatomic,strong)NSString *sd_company;
// 物流单号
@property(nonatomic,strong)NSString *sd_company_code;
//物流公司的类型
@property(nonatomic,strong)NSString *sd_company_type;
// 是否晒物流信息, {0: 否, 1: 是}
@property(nonatomic,strong)NSString *sd_sd_is_show_express;
// 晒单内容
@property(nonatomic,strong)NSString *sd_sd_content;
// 中奖人此期总参与次数
@property(nonatomic,strong)NSString *sd_go_total;
// 晒单图片url
@property(nonatomic,strong)NSArray *sd_sd_photolist_url;
//奖励积分
@property(nonatomic,strong)NSString *sd_score;

@end
