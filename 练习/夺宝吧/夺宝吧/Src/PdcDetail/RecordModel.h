//
//  RecordModel.h
//  夺宝吧
//
//  Created by xiaocai on 15/6/30.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecordModel : NSObject
// 商品id
@property (nonatomic,strong)NSString *record_id;
// 同一商品ID
@property (nonatomic,strong)NSString *record_sid;
// 用户uid
@property (nonatomic,strong)NSString *record_uid;
// 用户头像
@property (nonatomic,strong)NSString *record_img;
// 用户名
@property (nonatomic,strong)NSString *record_name;
// ip地址
@property (nonatomic,strong)NSString *record_ip;
// 购买次数
@property (nonatomic,strong)NSString *record_totle;
// 购买时间
@property (nonatomic,strong)NSString *record_time;
// ip所在地区
@property (nonatomic,strong)NSString *record_address;
//中奖号码
@property (nonatomic,strong)NSString *record_code;
// 购买日期
@property (nonatomic,strong)NSString *record_data;
@property (nonatomic,strong)NSMutableArray *record_records;
@end
