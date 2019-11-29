//
//  RewardModel.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/21.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RewardModel : NSObject
// 商品id
@property (nonatomic,strong)NSString *reward_id;
//订单id
@property (nonatomic,strong)NSString *reward_order_id;
 // 晒单奖励积分
@property (nonatomic,strong)NSString *reward_share_order_score;
// 期数
@property (nonatomic,strong)NSString *reward_qishu;
// 商品标题
@property (nonatomic,strong)NSString *reward_title;
// 中奖码
@property (nonatomic,strong)NSString *reward_code;
// 揭晓倒计时结束时间
@property (nonatomic,strong)NSString *reward_time;
 // 订单状态
@property (nonatomic,strong)NSArray *reward_status;
// 是否虚拟商品 {0: 否, 1: 是}
@property (nonatomic,strong)NSString *reward_is_virtual;
// 虚拟商品充值类型 {0: 未知, 1: qq号, 2: 手机号, 3: 支付宝帐号}
@property (nonatomic,strong)NSString *reward_virtual_recharge_type;
// 物流公司
@property (nonatomic,strong)NSString *reward_company;
// 物流单号
@property (nonatomic,strong)NSString *reward_company_code;
// 物流代码
@property (nonatomic,strong)NSString *reward_company_mark;
// 运费
@property (nonatomic,strong)NSString *reward_company_money;
// 充值QQ
@property (nonatomic,strong)NSString *reward_recharge_qq;
// 充值手机号码
@property (nonatomic,strong)NSString *reward_recharge_mobile;
// 充值支付宝帐号
@property (nonatomic,strong)NSString *reward_recharge_alipay;
// 缩略图url
@property (nonatomic,strong)NSString *reward_imgPath;
// 此期总参与次数
@property (nonatomic,strong)NSString *reward_go_total;
// 当前订单状态
@property (nonatomic,strong)NSString *reward_current_status;
//当前订单状态值
@property (nonatomic,strong)NSNumber *reward_current_status_value;
//订单状态数组
@property (nonatomic,strong)NSArray *reward_status_list;
//收货人姓名
@property (nonatomic,strong)NSString *reward_owner_name;
@property (nonatomic,strong)NSString *reward_address;
@property (nonatomic,strong)NSString *reward_phone;
@end
