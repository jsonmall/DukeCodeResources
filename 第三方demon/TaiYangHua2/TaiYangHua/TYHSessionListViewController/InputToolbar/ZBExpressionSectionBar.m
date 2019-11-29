//
//  ZBExpressionSectionBar.m
//  MessageDisplay
//
//  Created by zhoubin@moshi on 14-5-13.
//  Copyright (c) 2014年 Crius_ZB. All rights reserved.
//

#import "ZBExpressionSectionBar.h"
#import "UIImage+CH.h"
@interface ZBExpressionSectionBar ()
@property (nonatomic,strong) UIButton *sendBtn;

@end

@implementation ZBExpressionSectionBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIButton *btn = [[UIButton alloc] init];
        UIColor *blue = color227shallblue;
        [btn setBackgroundImage:[UIImage imageWithColor:blue] forState:UIControlStateNormal];
        [btn setTitle:@"发送" forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickSend) forControlEvents:UIControlEventTouchUpInside];
        _sendBtn = btn;
        [self addSubview:_sendBtn];
    }
    return self;
}

- (void)clickSend
{
    if ([self.delegate respondsToSelector:@selector(didClickSendFaceBtn)]) {
        [self.delegate didClickSendFaceBtn];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    WS(weakself);
    [_sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakself.mas_right).offset(0);
        make.top.equalTo(weakself.mas_top);
        make.bottom.equalTo(weakself.mas_bottom);
        make.width.equalTo(@55);
    }];
}
@end
