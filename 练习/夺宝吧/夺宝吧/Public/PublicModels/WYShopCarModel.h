//
//  WYShopCarModel.h
//  PV
//
//  Created by 王琰 on 14/12/8.
//  Copyright (c) 2014年 王琰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYShopCarModel : NSObject
//产品id
@property (nonatomic,strong)NSString *car_id;
//最新的id
@property (nonatomic,strong)NSString *car_new_id;
//商品名字
@property (nonatomic,strong)NSString *name;
//商品的价格
@property (nonatomic,strong)NSString *price;
//定金价
@property (nonatomic,strong)NSString *yPrice;
//数量
@property (nonatomic,assign)int count;
//记录选中状态
@property (nonatomic,assign)BOOL selectedFlag;
//图片链接
@property (nonatomic,strong)NSString *imgPath;
//总需
@property (nonatomic,strong)NSString *all_need;
//剩余
@property (nonatomic,strong)NSString *left_need;
//期数
@property (nonatomic,strong)NSString *qishu;
/**************购物车中记录包尾前的数量*******************/
@property (nonatomic,assign)int beforeCount;
@end
