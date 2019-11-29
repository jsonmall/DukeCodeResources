//
//  NewPublishPdcModel.m
//  夺宝吧
//
//  Created by xiaocai on 15/7/2.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "NewPublishPdcModel.h"

@interface NewPublishPdcModel ()
{
    //记录开始时间
    NSInteger start_time;
}
@end
@implementation NewPublishPdcModel
//设置倒计时时间
- (void)setPdc_new_countdown_time:(NSInteger)pdc_new_countdown_time
{
    _pdc_new_countdown_time = pdc_new_countdown_time;
    start_time = (NSInteger)[[NSDate date] timeIntervalSince1970];
}
//取真实倒计时事件
- (NSInteger)pdc_real_time
{
    NSInteger time = (NSInteger)[[NSDate date] timeIntervalSince1970];
    _pdc_real_time = _pdc_new_countdown_time - (time - start_time);
    if (_pdc_real_time<=0) {
        return 0;
    }
    return _pdc_real_time;
}
@end
