//
//  EditAddressView.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/24.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditAddressVC.h"
@interface EditAddressView : UIView
@property (nonatomic,weak)EditAddressVC *father;
//省
@property(nonatomic,strong)NSString *sheng;
//市
@property(nonatomic,strong)NSString *shi;
//县
@property(nonatomic,strong)NSString *xian;
//默认信息
- (void)MorenInfoWitnName:(NSString *)name Phone:(NSString *)phone Address:(NSString *)address Detail:(NSString *)detail Sheng:(NSString *)sheng Shi:(NSString*)shi Xian:(NSString *)xian;
//去掉window的遮罩
- (void)removeZheZhao;
//改变地址)
- (void)changeArea:(NSString *)area;
@end
