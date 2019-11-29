//
//  CustomViewController.m
//  CustomNavigationBarDemo
//
//  Created by jimple on 14-1-6.
//  Copyright (c) 2014年 Jimple Chen. All rights reserved.
//

#import "HMCustomViewController.h"
#import "HMCustomNaviBarView.h"
#import "CustomNavigationController.h"

@interface HMCustomViewController ()

@property (nonatomic, readonly) HMCustomNaviBarView *m_viewNaviBar;

@end

@implementation HMCustomViewController
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
    
    _viewNaviBar = [[HMCustomNaviBarView alloc] initWithFrame:Rect(0.0f, 0.0f, [HMCustomNaviBarView barSize].width, [HMCustomNaviBarView barSize].height)];
    _viewNaviBar.m_viewCtrlParent = self;
    [self.view addSubview:_viewNaviBar];
    
//    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[[UIImage imageNamed:@"GlobalBg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)]]];
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
}

#pragma mark -

-(UIView *)viewNaviBar
{
    return _viewNaviBar;
}

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
-(UIButton *)naviLeftBtn
{
    if (_viewNaviBar) {
       return [_viewNaviBar getLeftBtn];
    }else{
        return nil;
    }
}
-(UIButton *)naviRightBtn
{
    if (_viewNaviBar) {
        return [_viewNaviBar getRightBtn];
    }else{
        return  nil;
    }
}

-(UILabel *)naviTitle
{
    if (_viewNaviBar) {
        return [_viewNaviBar getTitleLabel];
    }else{
        return nil;
    }
}

-(UIView *)barView
{
    if (_viewNaviBar) {
        return [_viewNaviBar viewWithTag:1024];
    }else{
        return nil;
    }
}
- (void)setNaviBarTitle:(NSString *)strTitle
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setTitle:strTitle];
    }else{APP_ASSERT_STOP}
}

- (void)setNaviBarLeftBtn:(UIButton *)btn
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setLeftBtn:btn];
    }else{APP_ASSERT_STOP}
}

- (void)setNaviBarRightBtn:(UIButton *)btn
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setRightBtn:btn];
    }else{APP_ASSERT_STOP}
}

- (void)naviBarAddCoverView:(UIView *)view
{
    if (_viewNaviBar && view)
    {
        [_viewNaviBar showCoverView:view animation:NO];
        [self.view bringSubviewToFront:_viewNaviBar];
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

// 是否可右滑返回
- (void)navigationCanDragBack:(BOOL)bCanDragBack
{
    if (self.navigationController)
    {
        [((CustomNavigationController *)(self.navigationController)) navigationCanDragBack:bCanDragBack];
    }else{}
}

-(void)clearColor
{
    self.view.backgroundColor = [UIColor clearColor];
    _viewNaviBar.backgroundColor = [UIColor clearColor];
    
}


@end
