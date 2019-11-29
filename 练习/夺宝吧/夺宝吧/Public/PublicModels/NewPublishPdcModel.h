//
//  NewPublishPdcModel.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/2.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewPublishPdcModel : NSObject
// 商品id
@property (nonatomic,strong)NSString *pdc_new_id;
// 同一商品ID
@property (nonatomic,strong)NSString *pdc_new_sid;
// 期数
@property (nonatomic,strong)NSString *pdc_new_qishu;
// 商品标题
@property (nonatomic,strong)NSString *pdc_new_title;
// 副标题
@property (nonatomic,strong)NSString *pdc_new_sutitle;
// 商品描述
@property (nonatomic,strong)NSString *pdc_new_desc;
// 中奖人ID
@property (nonatomic,strong)NSString *pdc_new_owner_id;
// 中奖人用户名
@property (nonatomic,strong)NSString *pdc_new_owner_name;
// 中奖码
@property (nonatomic,strong)NSString *pdc_new_owner_code;
// 揭晓倒计时结束时间
@property (nonatomic,strong)NSString *pdc_new_end_time;
// 是否开始揭晓倒计时, {'Y': 是, 'N': 否}
@property (nonatomic,strong)NSString *pdc_new_showTimeFlag;
// 缩略图url
@property (nonatomic,strong)NSString *pdc_new_imgUrl;
// 倒计时秒数
@property (nonatomic,assign)NSInteger pdc_new_countdown_time;
//实际倒计时时间
@property (nonatomic,assign)NSInteger pdc_real_time;
// 中奖人此期总参与次数
@property (nonatomic,assign)NSInteger pdc_new_totle_people_num;

@end
