//
//  GetNumView.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/30.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XuNiView.h"
@interface GetNumView : UIView
@property (nonatomic,weak)XuNiView *father;
//订单id
@property (nonatomic,strong)NSString *order_id;
//显示类型
@property (nonatomic,strong)NSString *order_type;
@end
