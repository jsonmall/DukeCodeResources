//
//  OwnerModel.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/2.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OwnerModel : NSObject
// 商品id
@property(nonatomic,strong)NSString *owner_id;
// 同一商品ID
@property(nonatomic,strong)NSString *owner_sid;
// 期数
@property(nonatomic,strong)NSString *owner_qishu;
// 揭晓倒计时结束时间
@property(nonatomic,strong)NSString *owner_time;
// 用户uid
@property(nonatomic,strong)NSString *owner_uid;
// 用户头像
@property(nonatomic,strong)NSString *owner_img_header;
// 用户名
@property(nonatomic,strong)NSString *owner_name;
// 收货地址
@property(nonatomic,strong)NSString *owner_address;
// 中奖码
@property(nonatomic,strong)NSString *owner_num;
// 购买次数
@property(nonatomic,strong)NSString *owner_totle;
//奖品状态
@property(nonatomic,strong)NSNumber *owner_statu;
@end
