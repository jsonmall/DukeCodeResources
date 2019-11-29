//
//  UIDeviceDetailsViewController.h
//  CloudPlatform
//
//  Created by orvibo on 15/7/3.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "CommonNaviController.h"

@interface UIDeviceDetailsViewController : CommonNaviController

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, strong)HMDevice *device;


@end
