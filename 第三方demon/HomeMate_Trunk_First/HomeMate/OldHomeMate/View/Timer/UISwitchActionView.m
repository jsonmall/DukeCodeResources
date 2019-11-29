//
//  UISwitchActionView.m
//  CloudPlatform
//
//  Created by orvibo on 15/5/14.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "UISwitchActionView.h"

@implementation UISwitchActionView
{
    void(^_actionBlock)(UIButton *sender);
}

- (instancetype)initWithFrame:(CGRect)frame actionBlock:(void(^)(UIButton *sender))block
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = CommonBgColor;
        _actionBlock = [block copy];
        for (int i = 0; i < 2; i ++) {
            UIButton *switchBtn = [[UIButton alloc] init];
            switchBtn.frame = CGRectMake(50*VProportionImg+(35+120)*VProportionImg*i, 45*VProportionImg, 120*VProportionImg, 120*VProportionImg);
            [self addSubview:switchBtn];
            if (0 == i) {
                switchBtn.tag = KOpen;
                [switchBtn setBackgroundImage:[UIImage imageNamed:@"SwitchActionOPEN.png"] forState:UIControlStateNormal];
                [switchBtn setTitle:NSLocalizedString(@"Open", nil) forState:UIControlStateNormal];
                [switchBtn setTitleColor:CommonGreenColor forState:UIControlStateNormal];
            }else{
                switchBtn.tag = KClose;
                [switchBtn setBackgroundImage:[UIImage imageNamed:@"SwitchActionClose.png"] forState:UIControlStateNormal];
                [switchBtn setTitle:NSLocalizedString(@"Close", nil) forState:UIControlStateNormal];
                [switchBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

            }
            [switchBtn addTarget:self action:@selector(didSelectedAction:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return self;
}
-(void)didSelectedAction:(UIButton *)sender
{
    _actionBlock(sender);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
