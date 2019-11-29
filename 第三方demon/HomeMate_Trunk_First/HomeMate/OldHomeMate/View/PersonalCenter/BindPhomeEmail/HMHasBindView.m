//
//  UnBindView.m
//  HomeMate
//
//  Created by orvibo on 15/8/14.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "HMHasBindView.h"
#import "UIChangeColorButton.h"

@interface HMHasBindView()

@property (nonatomic, weak) id<HMHasBindViewDelegate>delegate;

@end

@implementation HMHasBindView
{
    BOOL            _isEmail;
    NSString       *_numberStr;
}

-(instancetype)initWithFrame:(CGRect)frame email:(BOOL)isEmail numberStr:(NSString *)numberStr delegate:(id<HMHasBindViewDelegate>)delegate;
{
    self = [super initWithFrame:frame];
    if (self) {
        _isEmail = isEmail;
        _numberStr = numberStr;
        self.delegate = delegate;
        [self setupSubViews];
    }
    return self;
}

-(void)setupSubViews
{
    NSString *imageName;
    if (_isEmail) {
        imageName = @"EmailIcon.png";
    }else{
        imageName = @"PhoneIcon.png";
    }
    UIImageView *phoneImgView = [[UIImageView alloc] init];
    if (_isEmail) {
        phoneImgView.frame = CGRectMake((ScreenWidth-(195/2.0))/2.0, 50, 195/2.0, 113/2.0);
    }else{
        phoneImgView.frame = CGRectMake((ScreenWidth-96.5)/2.0, 50, 96.5, 165.5);
    }
    phoneImgView.image = [UIImage imageNamed:imageName];
    [self addSubview:phoneImgView];
    
    UILabel *tipLabel = [[UILabel alloc] init];//已绑定手机号：182****2547，已绑定邮箱：zh****12@163.com
    tipLabel.font = [UIFont systemFontOfSize:16];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.numberOfLines = 0;
    tipLabel.backgroundColor = [UIColor clearColor];
    tipLabel.textColor = [UIColor blackColor];
    NSString *tipStr;
    NSString *tempNum = _numberStr;
    if (_isEmail) {
        tipStr = NSLocalizedString(@"LocalizableBoundMail", nil);
        NSRange aRange = [tempNum rangeOfString:@"@"];
        if (aRange.location != NSNotFound) {
            if (aRange.location <= 3) {
                tempNum = [tempNum stringByReplacingCharactersInRange:NSMakeRange(aRange.location-1, 1) withString:@"*"];
            }else if (aRange.location > 3 && aRange.location <= 5){
                if (aRange.location/2 + 2 < tempNum.length) {
                    tempNum = [tempNum stringByReplacingCharactersInRange:NSMakeRange(aRange.location/2, 2) withString:@"**"];
                }
            }else if(aRange.location >= 6){
//                if (aRange.location/2-2 + 4 <= tempNum.length) {
                    tempNum = [tempNum stringByReplacingCharactersInRange:NSMakeRange(2, aRange.location - 4) withString:@"****"];
//                }
            }
        }
    }else{
        tipStr = NSLocalizedString(@"LocalizablehasBindPhoneNumber", nil);
        tempNum = [tempNum stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    }
    tipStr = [tipStr stringByReplacingOccurrencesOfString:@"XXX" withString:tempNum];
    CGSize tipSize = GetLabelSize(@{NSFontAttributeName:[UIFont systemFontOfSize:16]}, CGSizeMake(ScreenWidth-30, 100), tipStr);
    tipLabel.frame = CGRectMake(15, CGRectGetMaxY(phoneImgView.frame)+50, ScreenWidth-30, tipSize.height);
    tipLabel.text = tipStr;
    [self addSubview:tipLabel];
    
    NSString *changeBtnName;
    if (_isEmail) {
        changeBtnName = NSLocalizedString(@"LocalizableReplaceTheMailbox", nil);
    }else{
        changeBtnName = NSLocalizedString(@"LocalizableReplacingThePhoneNumber", nil);
    }
    UIChangeColorButton *changesBtn = [[UIChangeColorButton alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(tipLabel.frame)+15, ScreenWidth-30, 45)];
    [changesBtn setNormalColor:CommonGreenColor HighlightedColor:CommonGreenColorAlpha(0.5) cornerRadius:5];
    [changesBtn setTitle:changeBtnName forState:UIControlStateNormal];
    [changesBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:changesBtn];
    [changesBtn addTarget:self action:@selector(changeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)changeBtnClick:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickReplaceBindingButton)]) {
        [self.delegate performSelector:@selector(clickReplaceBindingButton)];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
