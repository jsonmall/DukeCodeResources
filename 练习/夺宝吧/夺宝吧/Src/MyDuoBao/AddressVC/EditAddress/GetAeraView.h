//
//  GetAeraView.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/24.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZAreaPickerView.h"
#import "EditAddressView.h"
@interface GetAeraView : UIView
@property (nonatomic,weak)EditAddressView *father;
@property (strong, nonatomic) HZAreaPickerView *locatePicker;
@end
