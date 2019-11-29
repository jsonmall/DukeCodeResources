//
//  JDWebPayVC.m
//  夺宝吧
//
//  Created by xiaocai on 15/7/17.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "JDWebPayVC.h"
#import "PayedVC.h"
@interface JDWebPayVC ()<UIWebViewDelegate>
{
    //网页
    UIWebView *_webView;
    //进度提示
    UIActivityIndicatorView *flower;
    //请求成功页面的标志
    BOOL isSuccessFlag;
}
@end

@implementation JDWebPayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 44, WYMWITH, WYMHEIGHT-44)];
    [self.view addSubview:_webView];
    _webView.delegate = self;
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]]];
    [self loadCustomNavigationBar];
}
/*************
 *加载navigationbar
 ***************/
- (void)loadCustomNavigationBar
{
    UIView *naviBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WYMWITH, 64)];
    naviBar.backgroundColor = QBB_RED_COLOR;
    [self.view addSubview:naviBar];
    //左按钮
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(5, 25, 30, 30);
    [leftBtn setImage:[UIImage imageNamed:@"icon_back_white_press"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(backBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [naviBar addSubview: leftBtn];
    //中间标题
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 220, 30)];
    titleLab.center = CGPointMake(WYMWITH/2, 20+44/2);
    titleLab.text = self.mtitle;
    titleLab.textColor = [UIColor whiteColor];
    titleLab.font = [UIFont systemFontOfSize:TITLE_SIZE];
    titleLab.textAlignment = NSTextAlignmentCenter;
    [naviBar addSubview: titleLab];
    
}
//返回按钮监听事件
- (void)backBtnOnClick:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    flower = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0,0, 100, 100)];
    flower.center = CGPointMake(WYMWITH/2, WYMHEIGHT/2);
    flower.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self.view addSubview:flower];
    [flower startAnimating];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [flower stopAnimating];
    
    if (isSuccessFlag) {
        //跳往支付结果界面刷新结果
        //跳往支付结果界面
        [self.navigationController popViewControllerAnimated:YES];
        PayedVC *payedVC = [[PayedVC alloc]init];
        payedVC.isChongZhiFlag = YES;
        payedVC.money = self.money;
        [[WYMainTabBarVC shareMainTaBarVC].navigationController popToRootViewControllerAnimated:NO];
        [[WYMainTabBarVC shareMainTaBarVC]changeSelectedWithIndex:2];
        [[WYMainTabBarVC shareMainTaBarVC].navigationController pushViewController:payedVC animated:YES];
        
        if(self.isChongZhiFlag){
            payedVC.rltType = ChongZhiSuccess;
        }else{
            payedVC.rltType = PdcSuccess;
        }
        [payedVC updateViews];
    }
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    /*absoluteString;
     relativeString;
     parameterString*/
    NSString *urlstr = [NSString stringWithFormat:@"%@",request.URL];
    NSLog(@"urlstr = %@",urlstr);
    /***********购买成功***********/
    if ([urlstr rangeOfString:@"/ApiPay/successUrl"].location != NSNotFound){
        
        isSuccessFlag = YES;
        
    }else {
        isSuccessFlag = NO;
    }
//    NSLog(@"点击了,urla=%@.url = %@",request.URL,request.URL.scheme);
//    // 说明协议头是ios
//    if ([@"ios" isEqualToString:request.URL.scheme]) {
//        NSLog(@"++++++++");
//        return NO;
//    }
    
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
