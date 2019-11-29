//
//  EditAddressVC.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/23.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShiWuFooter.h"
@interface EditAddressVC : UIViewController
//是否是中奖流程里面去编辑地址状态标志
@property (nonatomic,assign)BOOL isZhongJiangFlag;
//订单id
@property (nonatomic,strong)NSString *order_id;
//中奖流程界面的下部分
@property (nonatomic,weak)ShiWuFooter *lastFooter;
//默认信息
- (void)MorenInfoWitnName:(NSString *)name Phone:(NSString *)phone Address:(NSString *)address Detail:(NSString *)detail Sheng:(NSString *)sheng Shi:(NSString*)shi Xian:(NSString *)xian;
@end
