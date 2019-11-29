//
//  HMCityDbInfo.h
//  HomeMate
//
//  Created by liuzhicai on 16/1/18.
//  Copyright © 2016年 Air. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, KTableType) {
    KTableTypeDeviceDesc,
    KTableTypeDeviceLanguage,
    KTableTypeQrCode
};

@interface HMDeviceInfo : NSObject

+ (void)getDeviceInfoFromServer;



@end
