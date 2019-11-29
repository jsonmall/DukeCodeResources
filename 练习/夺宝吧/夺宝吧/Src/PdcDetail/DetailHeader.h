//
//  DetailHeader.h
//  夺宝吧
//
//  Created by xiaocai on 15/6/30.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PdcDetailVC.h"
typedef enum {
    typeBuyNow = 0,
    typeBuyContinue,
    typeWaitPublish,
    typeWaitPublishLogin,
    typePublishing,
    typePublishingLogin,
    typePublished,
    typePublishedLogin
}DetailType;
@interface DetailHeader : UIView
// 是否购买过此期商品
@property (nonatomic,assign)BOOL has_bought_flag;
// 商品id
@property (nonatomic,strong)NSString *pdc_id;
// 商品标题
@property (nonatomic,strong)NSString *pdc_title;
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
//期数
@property (nonatomic,strong)NSString *pdc_qishu;
//商品图片展示
@property (nonatomic,strong)NSArray *pdc_pics;

//创建header的方法
-(instancetype)initWithType:(DetailType)typeDetail andPics:(NSArray *)pics andDetailDic:(NSDictionary *)dic pdcId:(NSString *)pdc_id SID:(NSString *)sid;
//刷新时间
- (void)updateTimelab:(NSString *)time;
//刷新表头
- (void)reloadTabHeaderWithDic:(NSDictionary *)dic Type:(DetailType)type;
@end
