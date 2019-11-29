//
//  TYHInternalSessionNavigationBar.m
//  TaiYangHua
//
//  Created by Lc on 16/1/21.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "TYHInternalSessionNavigationBar.h"

@implementation TYHInternalSessionNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self returnButton];
        [self titleLabel];
        [self groupButton];
    }
    
    return self;
}

#pragma mark - lazy

- (UIButton *)returnButton
{
    if (!_returnButton) {
        UIButton *returnButton = [[UIButton alloc] init];
        [returnButton setImage:[UIImage imageNamed:@"backImage"] forState:UIControlStateNormal];
        _returnButton = returnButton;
        [self addSubview:_returnButton];
    }
    return _returnButton;
}

- (UIButton *)groupButton
{
    if (!_groupButton) {
        UIButton *groupButton = [[UIButton alloc] init];
        [groupButton setImage:[UIImage imageNamed:@"groupPerson"] forState:UIControlStateNormal];
        _groupButton = groupButton;
        [self addSubview:_groupButton];
    }
    
    return _groupButton;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textColor = [UIColor whiteColor];
        _titleLabel = titleLabel;
        [self addSubview:_titleLabel];
    }
    
    return _titleLabel;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.returnButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(0);
        make.centerY.equalTo(self);
        make.width.height.equalTo(@(50));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.centerX.equalTo(self);
    }];
    
    [self.groupButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-15);
        make.centerY.equalTo(self);
        make.top.equalTo(self).offset(5);
        make.bottom.equalTo(self).offset(-5);
    }];
}
@end
