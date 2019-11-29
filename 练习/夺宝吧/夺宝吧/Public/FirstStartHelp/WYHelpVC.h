//
//  WYHelpVC.h
//  私訂生活
//
//  Created by 王琰 on 15/1/14.
//  Copyright (c) 2015年 王琰. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WYHelpVC;
@protocol WYHelpVCDelegate <NSObject>

- (void)wyHelpHC:(WYHelpVC*)helpVC buttonClick:(UIButton*)sender;

@end

@interface WYHelpVC : UIViewController

@property (nonatomic , weak) id<WYHelpVCDelegate> delegate;

@end
