//
//  EnsureAddressView.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/29.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShiWuFooter.h"
@interface EnsureAddressView : UIView
@property (nonatomic,weak)ShiWuFooter *father;
//订单id
@property (nonatomic,strong)NSString *order_id;
@end
