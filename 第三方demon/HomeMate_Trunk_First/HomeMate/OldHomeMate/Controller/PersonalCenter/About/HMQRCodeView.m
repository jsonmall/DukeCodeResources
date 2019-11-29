//
//  HMQRCodeView.m
//  HomeMate
//
//  Created by orvibo on 15/11/18.
//  Copyright © 2015年 Air. All rights reserved.
//

#import "HMQRCodeView.h"
#import "UIButton+EnlargeEdge.h"

const int qrCodeViewTag = 1020234;

typedef void(^handleBlock)(void);

@interface HMQRCodeView()

@property (nonatomic, strong) handleBlock completion;

@end

@implementation HMQRCodeView

-(void)dealloc
{
    DLog(@"%s",__func__);
}

+(void)showInWindowCompletion:(void(^)(void))completionBlock
{
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    if ([window viewWithTag:qrCodeViewTag]) {
        return;
    }
    HMQRCodeView *qrCodeView = [[HMQRCodeView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    qrCodeView.tag = qrCodeViewTag;
    qrCodeView.completion = [completionBlock copy];
    qrCodeView.backgroundColor = [UIColor whiteColor];
    [qrCodeView initWithSubViews];
    [[[[UIApplication sharedApplication] delegate] window] addSubview:qrCodeView];
    qrCodeView.alpha = 0;
    [UIView animateWithDuration:.3 animations:^{
        qrCodeView.alpha = 1;
    }];
}

-(void)initWithSubViews
{
    UIImageView *bgImgView = [[UIImageView alloc] initWithFrame:self.frame];
    bgImgView.image = [UIImage imageNamed:@"bg_bgr.jpg"];
    [self addSubview:bgImgView];
    
    CGSize iconSize = CGSizeMake(229/2.0, 209/2.0);
    UIImageView *iconImgView = [[UIImageView alloc] initWithFrame:CGRectMake((ScreenWidth-iconSize.width)/2.0, 400*HProportionImg/2, iconSize.width, iconSize.height)];
    iconImgView.image = [UIImage imageNamed:@"bg_Icon.png"];
    [self addSubview:iconImgView];
    
    UILabel *appNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(iconImgView.frame)+20*VProportionImg, ScreenWidth, 17)];
    appNameLabel.backgroundColor = [UIColor clearColor];
    appNameLabel.textAlignment = NSTextAlignmentCenter;
    appNameLabel.textColor = [UIColor whiteColor];
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *appName = [bundle objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    if (!appName) {
        appName = [bundle objectForInfoDictionaryKey:@"CFBundleName"];
    }
    appNameLabel.text = appName;
    [self addSubview:appNameLabel];
    
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, ScreenHeight-72*VProportionImg, 156, 22)];
    imgView.image = [UIImage imageNamed:@"SmarterMoreLife.png"];
    imgView.center = CGPointMake(ScreenWidth/2, imgView.center.y);
    [self addSubview:imgView];
    
    UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 45*HProportionImg, 17, 17)];
    [cancelBtn setEnlargeEdgeWithTop:30 right:50 bottom:50 left:15];
    [cancelBtn setImage:[UIImage imageNamed:@"CloseLoadingViewBtn.png"] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cancelBtn];

}

-(void)cancelBtnClick:(UIButton *)sender
{
    self.completion();
    [UIView animateWithDuration:.3 animations:^{
        self.alpha = 0;
    }completion:^(BOOL finished) {
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self removeFromSuperview];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
