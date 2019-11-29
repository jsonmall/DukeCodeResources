//
//  UISwitchActionViewController.h
//  CloudPlatform
//
//  Created by orvibo on 15/5/14.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "CommonNaviController.h"
#import "UISwitchActionView.h"

@protocol UISwitchActionViewControllerDelegate;


@interface UISwitchActionViewController : CommonNaviController
@property (nonatomic, weak) id<UISwitchActionViewControllerDelegate>delegate;
@end

@protocol UISwitchActionViewControllerDelegate <NSObject>

-(void)didSelectedAction:(Status)status tip:(NSString *)tip;

@end