//
//  AgreementViewController.m
//  CloudPlatform
//
//  Created by orvibo on 15/7/8.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "AgreementViewController.h"

@interface AgreementViewController ()

@end

@implementation AgreementViewController

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self MTAViewBeginWithName:MTAPageRegister_Agreement];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self MTAViewEndWithName:MTAPageRegister_Agreement];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupNavigationBar];
    if (IOS7) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64*VProportion, ScreenWidth, ScreenHeight-64*VProportion)];
    NSString *htmlName = nil;
    if (CHinese) {
        htmlName = @"Agreement_cn";
    }else{
        htmlName = @"Agreement_en";
    }
    NSString *filePath = [[NSBundle mainBundle] pathForResource:htmlName ofType:@"html"];
    NSString *htmlStr = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSURL *baseUrl = [NSURL fileURLWithPath:filePath];
    [webView loadHTMLString:htmlStr baseURL:baseUrl];
    [webView setOpaque:NO];
    webView.backgroundColor = CommonBgColor;
    [self.view addSubview:webView];
}
-(void)leftBtnClick:(UIButton *)click
{
    [super leftBtnClick:click];
    [self MTAClickEventWithName:MTAClick_Register_Agreement_Back];
}
-(void)setupNavigationBar
{
    self.view.backgroundColor = CommonBgColor;
    NSDictionary *dic = [[NSDictionary alloc] initWithObjects:@[NSLocalizedString(@"AgreementNaviTitle", nil),@"backButton.png",CommonGreenColor] forKeys:@[Navi_Title,Navi_LeftImgNormal,Navi_BarBackgroundColor]];
    [self customizeNaviBarForDictionary:dic barType:navi_OnlyLeftBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
