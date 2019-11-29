//
//  UITimerRepeatViewController.h
//  CloudPlatform
//
//  Created by orvibo on 15/5/13.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "CommonNaviController.h"

@protocol UITimerRepeatViewControllerDelegate;

@interface UITimerRepeatViewController : CommonNaviController

@property (nonatomic, weak) id<UITimerRepeatViewControllerDelegate>delegate;

- (void)setWeekWithWeekEscapeValue:(NSInteger)weekValue;

-(void)initSubviews;


@end

@protocol UITimerRepeatViewControllerDelegate <NSObject>

-(void)didSelectedWeek:(int)weekValue;

@end