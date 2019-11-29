//
//  VHAPWifiInfo.m
//  HomeMate
//
//  Created by liqiang on 15/8/11.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "VHAPWifiInfo.h"

@implementation VHAPWifiInfo
- (instancetype)initForDic:(NSDictionary *)dic {
    if (self = [super init]) {
        self.auth =[dic objectForKey:@"auth"];
        self.bssid = [dic objectForKey:@"bssid"];
        self.channel = [[dic objectForKey:@"channel"] integerValue];
        self.enc = [dic objectForKey:@"enc"];
        self.rssi = [[dic objectForKey:@"rssi"] integerValue];
        self.ssid = [dic objectForKey:@"ssid"];
    }
    
    return self;

}



@end
