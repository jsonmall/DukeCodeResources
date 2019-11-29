//
//  AddressView.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/23.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressView : UIView
//隐藏子控件
- (void)hiddenSubViews:(BOOL)hiddenFlag;
//填充数据
- (void)fillViewWithName:(NSString *)name Phone:(NSString *)phone Address:(NSString *)address Sheng:(NSString *)sheng Shi:(NSString *)shi Xian:(NSString *)xian XiangXi:(NSString *)xiangxi;
@end
