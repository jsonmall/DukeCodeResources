//
//  CustomViewController.m
//  CustomNavigationBarDemo
//
//  Created by jimple on 14-1-6.
//  Copyright (c) 2014年 Jimple Chen. All rights reserved.
//

#import "CustomViewController.h"
#import "CustomNaviBarView.h"
#import "CustomNavigationController.h"
#import "UtilityFunc.h"


@interface CustomViewController ()

@property (nonatomic, readonly) CustomNaviBarView *m_viewNaviBar;

@end

@implementation CustomViewController
@synthesize m_viewNaviBar = _viewNaviBar;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.wantsFullScreenLayout = YES;
        
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.wantsFullScreenLayout = YES;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    

    NSArray * array = self.navigationController.viewControllers;
    CGFloat yoffset = 0;
    if ([array count] > 0 && IOSVersion < 7) {
        if ([[array objectAtIndex:0] isKindOfClass:NSClassFromString(@"UILoginViewController")]) {
            yoffset += 20;
        }
    }
    
    _viewNaviBar = [[CustomNaviBarView alloc] initWithFrame:Rect(0.0f, yoffset, [CustomNaviBarView barSize].width, [CustomNaviBarView barSize].height)];
    _viewNaviBar.m_viewCtrlParent = self;
    [self.view addSubview:_viewNaviBar];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[[UIImage imageNamed:@"GlobalBg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)]]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [UtilityFunc cancelPerformRequestAndNotification:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (_viewNaviBar && !_viewNaviBar.hidden)
    {
        [self.view bringSubviewToFront:_viewNaviBar];
    }else{}
    
    if (IOS7) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        //[self.view layoutIfNeeded];
        
        //[self.view setNeedsUpdateConstraints];
        
        //[self.view updateConstraintsIfNeeded];
        
        //[self.view setNeedsLayout];
        //[self.view layoutIfNeeded];
    }
}

#pragma mark -

- (void)bringNaviBarToTopmost
{
    if (_viewNaviBar)
    {
        [self.view bringSubviewToFront:_viewNaviBar];
    }else{}
}

- (void)hideNaviBar:(BOOL)bIsHide
{
    _viewNaviBar.hidden = bIsHide;
}

- (void)setNaviBarTitle:(NSString *)strTitle
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setTitle:strTitle];
    }else{
    }
}

- (void)setNaviBarLeftBtn:(UIButton *)btn
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setLeftBtn:btn];
    }else{}
}

- (void)setNaviBarLeftTextBtn:(UIButton *)btn
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setLeftTextBtn:btn];
    }else{}
}


- (void)setNaviBarRightBtn:(UIButton *)btn
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setRightBtn:btn];
    }else{}
}

- (void)setNaviBarRightTextBtn:(UIButton *)btn
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setRightTextBtn:btn];
    }else{}
}

- (UIButton *)rightTextButton
{
    return [_viewNaviBar rightTextButton];
}

- (void)naviBarAddCoverView:(UIView *)view
{
    if (_viewNaviBar && view)
    {
        [_viewNaviBar showCoverView:view animation:YES];
    }else{}
}

- (void)naviBarAddCoverViewOnTitleView:(UIView *)view
{
    if (_viewNaviBar && view)
    {
        [_viewNaviBar showCoverViewOnTitleView:view];
    }else{}
}

- (void)naviBarRemoveCoverView:(UIView *)view
{
    if (_viewNaviBar)
    {
        [_viewNaviBar hideCoverView:view];
    }else{}
}

- (void)setNaviBarRightView:(UIView *)view
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setRightCustomView:view];
    }else{}
    
}

// 是否可右滑返回
- (void)navigationCanDragBack:(BOOL)bCanDragBack
{
    if (self.navigationController)
    {
        [((CustomNavigationController *)(self.navigationController)) navigationCanDragBack:bCanDragBack];
    }else{}
}



@end
