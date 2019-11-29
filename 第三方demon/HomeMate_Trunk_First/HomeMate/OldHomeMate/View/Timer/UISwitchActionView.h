//
//  UISwitchActionView.h
//  CloudPlatform
//
//  Created by orvibo on 15/5/14.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum _Status{
    KOpen = 1,
    KClose,
}Status;

@interface UISwitchActionView : UIView
- (instancetype)initWithFrame:(CGRect)frame actionBlock:(void(^)(UIButton *sender))block;
@end
