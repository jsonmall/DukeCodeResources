//
//  UINoneDeviceView.m
//  CloudPlatform
//
//  Created by orvibo on 15/5/7.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "UINewNoneDeviceView.h"


@implementation UINewNoneDeviceView
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
-(void)dealloc
{
    DLog(@"%s",__func__);
}
- (instancetype)initWithFrame:(CGRect)frame block:(void(^)(UIButton *btn))block
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        UIView *topBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 472/2.0*VProportionImg+20)];
        _topBgViewFrame = topBgView.frame;
        topBgView.backgroundColor = CommonGreenColor;
        [self addSubview:topBgView];
        UIImageView *lightImageView = [[UIImageView alloc] initWithFrame:CGRectMake((ScreenWidth-125*HProportionImg)/2.0, 64*VProportion + 25*VProportionImg, 125*HProportionImg, 125*VProportionImg)];
                lightImageView.image = [UIImage imageNamed:@"bg_light.png"];
        [topBgView addSubview:lightImageView];
        
//        UIImageView *squareCoreImageView = [[UIImageView alloc] initWithFrame:CGRectMake((ScreenWidth-135*HProportionImg)/2.0, CGRectGetMaxY(topBgView.frame) + 67*VProportionImg, 135*HProportionImg, 135*VProportionImg)];
//        squareCoreImageView.userInteractionEnabled = YES;
//        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addDeviceHandleGes:)];
//        [squareCoreImageView addGestureRecognizer:tapGes];
//        squareCoreImageView.image = [UIImage imageNamed:@"icon_scanning.png"];
//        [self addSubview:squareCoreImageView];
        
        UIButton *squareCoreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        squareCoreBtn.frame = CGRectMake((ScreenWidth-135*HProportionImg)/2.0, CGRectGetMaxY(topBgView.frame) + 67*VProportionImg, 135*HProportionImg, 135*VProportionImg);
        [squareCoreBtn setBackgroundImage:[UIImage imageNamed:@"icon_scanning.png"] forState:UIControlStateNormal];
        [squareCoreBtn addTarget:self action:@selector(addDeviceHandle:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:squareCoreBtn];
        
        UIButton *addDeviceBtn = IOS7 ? [UIButton buttonWithType:UIButtonTypeSystem] : [UIButton buttonWithType:UIButtonTypeCustom];
        addDeviceBtn.frame = CGRectMake(0, CGRectGetMaxY(squareCoreBtn.frame) + 65/2.0*VProportionImg, ScreenWidth, 20*VProportionImg);
        [addDeviceBtn setTitle:NSLocalizedString(@"ScanCodeAddDevice", nil) forState:UIControlStateNormal];
        addDeviceBtn.titleLabel.font = [UIFont systemFontOfSize:19];
        [addDeviceBtn setTitleColor:RGB(49, 195, 124) forState:UIControlStateNormal];
        [addDeviceBtn addTarget:self action:@selector(addDeviceHandle:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:addDeviceBtn];
        _btnBlock = [block copy];
        
        UILabel *tipLabel = [[UILabel alloc] init];
        tipLabel.textColor = SceneBoardTextColor;
        tipLabel.font = [UIFont systemFontOfSize:13];
        tipLabel.numberOfLines = 0;
        tipLabel.textAlignment = NSTextAlignmentCenter;
        NSString *tipText = NSLocalizedString(@"ScanCodeTips", nil);
        tipLabel.text = tipText;
        NSDictionary *dic = @{NSFontAttributeName:tipLabel.font};
        CGSize size = CGSizeMake(ScreenWidth-20, 1000);
        CGSize tipSize = GetLabelSize(dic, size, tipText);
        tipLabel.frame = CGRectMake((ScreenWidth-tipSize.width)/2.0, CGRectGetMaxY(addDeviceBtn.frame)+5*VProportionImg, tipSize.width, tipSize.height);
        [self addSubview:tipLabel];
    }
    return self;
}

- (void)addDeviceHandleGes:(UITapGestureRecognizer *)tap
{
    [self addDeviceHandle:nil];
}

-(void)addDeviceHandle:(UIButton *)btn
{
    _btnBlock(btn);
}

@end
