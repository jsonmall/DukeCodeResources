//
//  TYHBanner.h
//  TaiYangHua
//
//  Created by Lc on 16/4/28.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYHBanner : NSObject
@property (copy, nonatomic) NSString *timerString;

+ (instancetype)bannerWithTimerString:(NSString *)string;
@end

