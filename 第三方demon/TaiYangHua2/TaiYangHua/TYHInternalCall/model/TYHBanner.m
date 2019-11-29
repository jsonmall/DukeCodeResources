//
//  TYHBanner.m
//  TaiYangHua
//
//  Created by Lc on 16/4/28.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "TYHBanner.h"

@implementation TYHBanner
+ (instancetype)bannerWithTimerString:(NSString *)string
{
    TYHBanner *banner = [[self alloc] init];
    banner.timerString = string;
    
    return banner;
}
@end
