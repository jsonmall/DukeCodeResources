//
//  ProductModel.h
//  夺宝吧
//
//  Created by xiaocai on 15/6/16.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductModel : NSObject
// 商品id
@property (nonatomic,strong)NSString *pdc_id;
// 同一商品ID
@property(nonatomic,strong)NSString *pdc_sid;
// 商品标题
@property (nonatomic,strong)NSString *pdc_title;
//期数
@property (nonatomic,strong)NSString *pdc_qishu;
// 副标题
@property (nonatomic,strong)NSString *pdc_sub_title;
//商品描述
@property (nonatomic,strong)NSString *pdc_desc;
// 总需人数
@property (nonatomic,strong)NSString *pdc_people_indeed;
// 已参与人数
@property (nonatomic,strong)NSString *pdc_people_now;
// 剩余参与人数
@property (nonatomic,strong)NSString *pdc_people_left;
// 缩略图url
@property (nonatomic,strong)NSString *pdc_img_path;


@property (nonatomic,copy)NSString *is_locked;
@end
