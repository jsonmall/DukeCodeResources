//
//  ViewController.m
//  GPSrollView
//
//  Created by 郭大侠 on 2018/4/19.
//  Copyright © 2018年 郭大侠. All rights reserved.
//

#import "ViewController.h"
#import "ZCWScrollNumView.h"
#import "DTScrollNumberCoutView.h"
#define kAllFullSuperviewMask      UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
@interface ViewController ()
@property (weak, nonatomic) IBOutlet ZCWScrollNumView *scrollNumber;

@property (nonatomic, strong) DTScrollNumberCoutView *scrollNumberView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    CGRect tmp = {{0, 0}, {100, 100}};
    self.scrollNumber.numberSize = 8;
    UIImage *image = [[UIImage imageNamed:@"bj_numbg"] stretchableImageWithLeftCapWidth:10 topCapHeight:14];
    self.scrollNumber.backgroundView = [[UIImageView alloc] initWithImage:image];
    UIView *digitBackView = [[UIView alloc] initWithFrame:tmp];
    digitBackView.backgroundColor = [UIColor clearColor];
    digitBackView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    digitBackView.autoresizesSubviews = YES;
    image = [[UIImage imageNamed:@"money_bg"] stretchableImageWithLeftCapWidth:12 topCapHeight:12];
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:image];
    bgImageView.frame = tmp;
    bgImageView.autoresizingMask = kAllFullSuperviewMask;
    [digitBackView addSubview:bgImageView];
    image = [[UIImage imageNamed:@"money_bg_mask"] stretchableImageWithLeftCapWidth:12 topCapHeight:12];
    UIImageView *bgMaskImageView = [[UIImageView alloc] initWithImage:image];
    bgMaskImageView.autoresizingMask = kAllFullSuperviewMask;
    bgMaskImageView.frame = tmp;
    [digitBackView addSubview:bgMaskImageView];
    self.scrollNumber.digitBackgroundView = digitBackView;
    self.scrollNumber.digitColor = [UIColor whiteColor];
    self.scrollNumber.digitFont = [UIFont systemFontOfSize:17.0];
    [self.scrollNumber didConfigFinish];
    
    
    
    
    
    
    _scrollNumberView = [[DTScrollNumberCoutView alloc]init];
    _scrollNumberView.backgroundColor = [UIColor whiteColor];
    _scrollNumberView.frame = CGRectMake(0, 100, 375, 100);
    UIImage *backGroudImage = [UIImage imageNamed:@"bg@2x.png"];
    // 左端盖宽度
    NSInteger leftCapWidth = backGroudImage.size.width * 0.5f;
    // 顶端盖高度
    NSInteger topCapHeight = backGroudImage.size.height * 0.5f;
    // 重新赋值
    backGroudImage = [backGroudImage stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
    
    _scrollNumberView.backGroudimageView.image = backGroudImage;
    
    // 加载图片
 

    CGFloat top = 2; // 顶端盖高度
    CGFloat bottom = 0 ; // 底端盖高度
    CGFloat left = 2; // 左端盖宽度
    CGFloat right = 2; // 右端盖宽度
    UIImage *backmasknumberimage = [UIImage imageNamed:@"shadow@2x.png"];
    UIImage *backnumberimage = [UIImage imageNamed:@"bg_num_r@2x.png"];
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
//    image = [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    backmasknumberimage = [backmasknumberimage stretchableImageWithLeftCapWidth:backmasknumberimage.size.width*0.5 topCapHeight:backmasknumberimage.size.height*0.5];
     backnumberimage = [backnumberimage stretchableImageWithLeftCapWidth:backnumberimage.size.width*0.5 topCapHeight:backnumberimage.size.height*0.5];
    _scrollNumberView.numbermaskBackImage = backmasknumberimage;
    _scrollNumberView.numberBackImage = backnumberimage;
    _scrollNumberView.textColor = [UIColor redColor];
    _scrollNumberView.font = [UIFont boldSystemFontOfSize:30];
    [self.view addSubview:_scrollNumberView];
    
    
    
}
- (IBAction)start:(id)sender {
    
    self.scrollNumberView.number = @(arc4random()%50000000+50000000);
    [self.scrollNumberView startAnimation];
    [self.scrollNumber setNumber:7892345566 withAnimationType:ZCWScrollNumAnimationTypeNormal animationTime:1.0];


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
