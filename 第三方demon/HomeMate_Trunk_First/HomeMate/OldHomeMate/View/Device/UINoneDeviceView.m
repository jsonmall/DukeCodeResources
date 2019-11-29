//
//  UINoneDeviceView.m
//  CloudPlatform
//
//  Created by orvibo on 15/5/7.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "UINoneDeviceView.h"


@implementation UINoneDeviceView
{
    void(^_btnBlock)(UIButton *btn);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame block:(void(^)(UIButton *btn))block
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        UIButton *addDeviceBtn = [[UIButton alloc] initWithFrame:CGRectMake(47*HProportionImg, 124*VProportionImg, 95*HProportionImg, 95*HProportionImg)];
        [addDeviceBtn setImage:[UIImage imageNamed:@"bidAddIcon.png"] forState:UIControlStateNormal];
        [addDeviceBtn addTarget:self action:@selector(addDeviceHandle:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:addDeviceBtn];
        _btnBlock = [block copy];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(47*HProportionImg, CGRectGetMaxY(addDeviceBtn.frame)+25*VProportionImg, 285.5*HProportionImg, 223.5*VProportionImg)];
        imageView.image = [UIImage imageNamed:@"tipImageView.png"];
        [self addSubview:imageView];
        
        UILabel *tipLabel = [[UILabel alloc] init];
        tipLabel.textColor = White248Color;
        tipLabel.font = [UIFont systemFontOfSize:16];
        tipLabel.numberOfLines = 0;
        tipLabel.textAlignment = NSTextAlignmentCenter;
        NSString *tipText = NSLocalizedString(@"AddDevicesBeforeUse", nil);
        tipLabel.text = tipText;
        NSDictionary *dic = @{NSFontAttributeName:tipLabel.font};
        CGSize size = CGSizeMake(285.5*HProportionImg, 50*VProportionImg);
        CGSize tipSize = GetLabelSize(dic, size, tipText);
        tipLabel.frame = CGRectMake(0, CGRectGetHeight(imageView.frame) - tipSize.height - 10*VProportionImg, size.width, tipSize.height);
        [imageView addSubview:tipLabel];
        if (!iOS7Later) {
            tipLabel.backgroundColor = [UIColor clearColor];
        }
        
    }
    return self;
}
-(void)addDeviceHandle:(UIButton *)btn
{
    _btnBlock(btn);
}

@end
