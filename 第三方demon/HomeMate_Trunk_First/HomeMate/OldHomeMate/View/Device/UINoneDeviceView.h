//
//  UINoneDeviceView.h
//  CloudPlatform
//
//  Created by orvibo on 15/5/7.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINoneDeviceView : UIView
- (instancetype)initWithFrame:(CGRect)frame block:(void(^)(UIButton *btn))block;


@end
