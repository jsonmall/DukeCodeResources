//
//  XMProfileController.m
//  XMProfileController
//
//  Created by sfk-ios on 2018/4/27.
//  Copyright © 2018年 aiq西米. All rights reserved.
//

#import "XMProfileController.h"
#import "UINavigationBar+Awesome.h"
#import "XMScrollView.h"

@interface XMProfileController ()<XMPageViewControllerDelegate,UIScrollViewDelegate>

/// 整体内容容器
@property (weak, nonatomic) XMScrollView *bgScrollView;
/// 子控制器容器
@property (weak, nonatomic) UIView *contentView;
/// 当前的tableView
@property (weak, nonatomic) UITableView *childTableView;
/// 覆盖头部图片的模糊view
@property (weak, nonatomic) UIToolbar *coverBar;

@property (nonatomic, assign) BOOL childTableShouldScroll;
@property (nonatomic, assign) BOOL shouldScroll;
@end

@implementation XMProfileController

- (instancetype)initWithChildViewControllerClasses:(NSArray *)childsClasses theirTitles:(NSArray *)titles
{
    self = [super init];
    
    if (self) {
        self.pageVc = [[XMPageViewController alloc] initWithViewControllerClasses:childsClasses andTheirTitles:titles];
        [self addChildViewController:self.pageVc];
    }
    return self;
}


- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self initUI];
    
    _childTableShouldScroll = NO;
    _shouldScroll = YES;
    
    // 监听是否正在滑动切换子控制器
    [self.pageVc addObserver:self forKeyPath:@"shouChangeChildVc" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)dealloc
{
    [self.pageVc removeObserver:self forKeyPath:@"shouChangeChildVc"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.bgScrollView.contentOffset.y == XM_HeaderH) { // 悬停在顶部
        [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor whiteColor]];
    }else {
        // 设置导航栏透明
        [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    }
    // 去掉导航栏下边的分割线
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    // 设置导航栏透明
    [self.navigationController.navigationBar lt_reset];
}

- (void)initUI
{
    UILabel *titleL= [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    titleL.textAlignment = NSTextAlignmentCenter;
    self.titleLabel = titleL;
    self.titleLabel.alpha = 0;
    self.titleLabel.hidden = YES;
    self.navigationItem.titleView = self.titleLabel;
    
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, XM_HeaderH+XM_NavbarH-XMSCREEN_WIDTH, XMSCREEN_WIDTH, XMSCREEN_WIDTH)];
    imgView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:imgView];
    self.headerImageView = imgView;
    
    // 模糊覆盖
    UIToolbar *coverBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, imgView.xm_width, imgView.xm_height)];
    coverBar.barStyle = UIBarStyleBlackTranslucent;
    coverBar.translucent = YES;
    coverBar.alpha = 0.4;
    [self.headerImageView addSubview:coverBar];
    self.coverBar = coverBar;
    
    XMScrollView *bgScrollView = [[XMScrollView alloc]initWithFrame:CGRectMake(0, 0, XMSCREEN_WIDTH, XMSCREEN_HEIGHT)];
    bgScrollView.delegate = self;
    bgScrollView.contentSize = CGSizeMake(XMSCREEN_WIDTH, XMSCREEN_HEIGHT +XM_HeaderH+XM_NavbarH);
    [self.view addSubview:bgScrollView];
    self.bgScrollView = bgScrollView;
    self.bgScrollView.showsVerticalScrollIndicator = NO;
    self.bgScrollView.directionalLockEnabled = YES;
    self.bgScrollView.contentOffset = CGPointZero;
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XMSCREEN_WIDTH, XM_HeaderH+XM_NavbarH)];
//    headerView.backgroundColor = [UIColor yellowColor];
    [self.bgScrollView addSubview:headerView];
    self.headerView = headerView;
    
    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(0, XM_HeaderH+XM_NavbarH, XMSCREEN_WIDTH, XMSCREEN_HEIGHT)];
    [self.bgScrollView addSubview:contentView];
    self.contentView = contentView;
    
    self.pageVc.viewFrame = CGRectMake(0, 0, XMSCREEN_WIDTH, XMSCREEN_HEIGHT-XM_NavbarH);
    self.pageVc.tableDelegate = self;
    [self.contentView addSubview:self.pageVc.view];
    
    // 如果是modal 出来的
    if (self.isModal) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"╳" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
    }
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
#ifdef __IPHONE_11_0
    if (@available(iOS 11.0, *)) {
        self.bgScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
#endif
}

- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)scrollTap:(UITapGestureRecognizer *)tap{
    
    [self.view endEditing:YES];
}

// 监听是否正在滑动切换子控制器
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"shouChangeChildVc"]) {
        self.bgScrollView.scrollEnabled = [change[@"new"] boolValue];
    }
}

/// 接收到tableView offsetY
- (void)childTableView:(UITableView *)tableView didScrollOffsetY:(CGFloat)offsetY 
{
//    NSLog(@"接收到tableView offsetY==%f",offsetY);
    
    if (![self.childTableView isEqual:tableView]) {
        self.childTableView = tableView;
    }
    
    if (offsetY >=XM_HeaderH) {
        self.bgScrollView.contentOffset = CGPointMake(0, offsetY);
    }else{
        if (offsetY<=0) { // 控制滚动条是否展示
            _shouldScroll = YES;
            tableView.contentOffset = CGPointZero;
            tableView.showsVerticalScrollIndicator = NO;
            // 头部出现后，各个子控制器的内容应该滚动到顶部
            [[NSNotificationCenter defaultCenter]postNotificationName:SHOULD_SCROLL_TO_TOP_NOTI object:nil];
        }else{
            tableView.showsVerticalScrollIndicator = YES;
            _shouldScroll = NO;
        }
        
        if (!_childTableShouldScroll ) {
            tableView.contentOffset = CGPointZero;
        }
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"scrollViewDidScroll==%f",scrollView.contentOffset.y);
    
    // 处理导航栏的透明等
    CGFloat maxOffsetY = XM_HeaderH;
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat halfHeaderH = XM_HeaderH*0.5;
    if (offsetY>halfHeaderH) {
        CGFloat alpha = (offsetY-halfHeaderH)/halfHeaderH;
        [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:alpha]];
        self.titleLabel.hidden = NO;
        self.titleLabel.alpha = alpha;
        self.headerView.alpha = 1-(offsetY/XM_HeaderH);
    }else{
        [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0]];
        self.titleLabel.alpha = 0;
        self.headerView.alpha = 1;
        self.titleLabel.hidden = YES;
    }
    
    // 处理内容滚动
    if (offsetY>=maxOffsetY) {
        scrollView.contentOffset = CGPointMake(0, maxOffsetY);
        //        NSLog(@"tab滑动到顶端==%f",scrollView.contentOffset.y);
        _childTableShouldScroll = YES;
    } else {
        //        NSLog(@"tab离开顶端==%f",scrollView.contentOffset.y);
        _childTableShouldScroll = NO;
        if (!_shouldScroll) {
            scrollView.contentOffset = CGPointMake(0, maxOffsetY);
        }
        
        /// bounces 最大距离
        if (offsetY<-(XMSCREEN_HEIGHT *0.4)) {
            scrollView.contentOffset = CGPointMake(0, -XMSCREEN_HEIGHT *0.4);
        }
        
        // 处理 headerImageView 的frame 以及缩放问题
        [self handleHeaderImageViewWithOffsetY:offsetY];
    }
}

// 处理 headerImageView 的frame 以及缩放问题
- (void)handleHeaderImageViewWithOffsetY:(CGFloat)offsetY{
    if (offsetY<0) {
        CGFloat scaleY = XM_HeaderH+XM_NavbarH-XMSCREEN_WIDTH;
        self.headerImageView.xm_y = XM_HeaderH+XM_NavbarH-XMSCREEN_WIDTH-offsetY;
        if (offsetY <= scaleY) {
            self.headerImageView.xm_y = 0;
            CGFloat scale = (-offsetY)/(XMSCREEN_WIDTH-XM_HeaderH-XM_NavbarH);
            scale = scale>1.5?1.5:scale;
//            NSLog(@"scale==%f",scale);
            self.headerImageView.xm_height = XMSCREEN_WIDTH*scale;
            self.headerImageView.transform = CGAffineTransformMakeScale(scale, 1);
        }else{
            self.headerImageView.transform = CGAffineTransformIdentity;
            self.headerImageView.xm_height = XMSCREEN_WIDTH;
        }
        self.coverBar.frame = self.headerImageView.bounds;
        self.coverBar.xm_x = 0;
        self.coverBar.xm_y = 0;
    }else {
        if (_shouldScroll) {
            self.headerImageView.xm_y = XM_HeaderH+XM_NavbarH-XMSCREEN_WIDTH-offsetY;
        }
    }
}

@end
