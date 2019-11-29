//
//  PayedView.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/15.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayedVC.h"
typedef enum {
    PdcSuccess=0,
    PdcFailed,
    ChongZhiSuccess,
    ChongZhiFailed
}ResultType;
@class PayedVC;
@interface PayedView : UIView
@property (nonatomic,assign)ResType rltType;
@property (nonatomic,weak)PayedVC *father;
@end
