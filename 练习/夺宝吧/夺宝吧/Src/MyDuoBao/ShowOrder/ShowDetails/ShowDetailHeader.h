//
//  ShowDetailHeader.h
//  夺宝吧
//
//  Created by xiaocai on 15/8/4.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowDetailVC.h"
@interface ShowDetailHeader : UIView
@property (nonatomic,weak)ShowDetailVC *father;
//调整坐标的标志
@property (nonatomic,assign)BOOL sizeFlag;
@end
