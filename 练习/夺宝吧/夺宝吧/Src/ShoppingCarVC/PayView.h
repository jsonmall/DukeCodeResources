//
//  PayView.h
//  夺宝吧
//
//  Created by xiaocai on 15/6/23.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayView : UIView

@property (nonatomic , weak) IBOutlet UILabel *payLab;

@property (nonatomic , weak) IBOutlet UIButton *PayBtn;
//刷新数据
- (void)changeColorWithCount:(NSInteger)count andMoney:(NSInteger)money;
//数据源
@property (nonatomic,strong)NSArray *data;
@end
