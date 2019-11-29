//
//  HMBaseTextField.m
//  HomeMate
//
//  Created by Air on 15/10/14.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "HMBaseTextField.h"

@implementation HMBaseTextField

-(void)setTintColor:(UIColor *)tintColor
{
    if (IOS7) {
        [super setTintColor:tintColor];
    }else{
        // IOS7 一下不支持 tintColor
    }
}

@end
