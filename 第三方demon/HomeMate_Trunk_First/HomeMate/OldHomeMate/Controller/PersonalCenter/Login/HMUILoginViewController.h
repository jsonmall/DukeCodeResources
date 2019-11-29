//
//  UILoginViewController.h
//  CloudPlatform
//
//  Created by orvibo on 15/6/6.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "CommonNaviController.h"
typedef NS_ENUM(NSInteger,ClickType){
    clicktypeNone,
    clicktypeUser,
    clicktypePass
};

@interface HMUILoginViewController : CommonNaviController

@property (nonatomic,assign) BOOL isPresent;

@property (nonatomic,assign) BOOL isFromScanResultPage;

@end
