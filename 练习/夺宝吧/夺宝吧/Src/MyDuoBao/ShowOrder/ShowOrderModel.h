//
//  ShowOrderModel.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/28.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShowOrderModel : NSObject
// 商品id
@property (nonatomic,strong)NSString *sd_pdc_id;
// 同一商品ID
@property (nonatomic,strong)NSString *sd_pdc_sid;
// 期数
@property (nonatomic,strong)NSString *sd_pdc_qishu;
// 商品标题
@property (nonatomic,strong)NSString *sd_pdc_title;
// 晒单id
@property (nonatomic,strong)NSString *sd_id;
// 晒单时间
@property (nonatomic,strong)NSString *sd_time;
// 用户uid
@property (nonatomic,strong)NSString *sd_uid;
//用户头像
@property (nonatomic,strong)NSString *sd_user_img;
// 用户名
@property (nonatomic,strong)NSString *sd_username;
// 晒单标题
@property (nonatomic,strong)NSString *sd_title;
// 晒单内容
@property (nonatomic,strong)NSString *sd_content;
// 晒单图片url
@property (nonatomic,strong)NSArray *sd_imgs;
// 是否通过审核, {0: 否, 1: 是}
@property (nonatomic,strong)NSString *sd_is_passed;
@end
