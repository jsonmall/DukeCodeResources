//
//  PublicActivityView.m
//  夺宝吧
//
//  Created by xiaocai on 15/7/21.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "PublicActivityView.h"

@implementation PublicActivityView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIActivityIndicatorView *ac = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        ac.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        ac.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        [ac startAnimating];
        [self addSubview:ac];
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    }
    return self;
}

@end
