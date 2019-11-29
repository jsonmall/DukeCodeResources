//
//  VHAPWifiInfo.h
//  HomeMate
//
//  Created by liqiang on 15/8/11.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VHAPWifiInfo : NSObject
@property (nonatomic, copy) NSString * auth;
@property (nonatomic, copy) NSString * bssid;
@property (nonatomic, copy) NSString * enc;
@property (nonatomic, copy) NSString * ssid;

@property (nonatomic, assign) NSInteger channel;
@property (nonatomic, assign) NSInteger rssi;

@property (nonatomic, assign) BOOL isSelected;

- (instancetype)initForDic:(NSDictionary *)dic;
@end
