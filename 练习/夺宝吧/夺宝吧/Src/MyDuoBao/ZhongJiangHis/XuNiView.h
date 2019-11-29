//
//  XuNiView.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/30.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RewardModel.h"
#import "RewardDetailVC.h"
@interface XuNiView : UIView
//是否是自己的标志
@property (nonatomic,assign)BOOL isMineFlag;
@property (nonatomic,weak)RewardDetailVC *father;
@property (nonatomic,strong)RewardModel *model;
//去掉遮罩
- (void)removeZheZhao;

//填充默认地址
- (void)fillNumWithQQ:(NSString *)numqq Phone:(NSString *)phone ZFB:(NSString *)zfb Andtime:(NSString *)time;
@end
