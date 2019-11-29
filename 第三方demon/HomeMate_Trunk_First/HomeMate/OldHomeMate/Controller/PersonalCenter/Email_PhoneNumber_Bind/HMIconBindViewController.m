//
//  HMIconBindViewController.m
//  HomeMate
//
//  Created by orvibo on 15/8/14.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "HMIconBindViewController.h"
#import "HMHasBindView.h"
#import "HMSecurityVerificationViewController.h"

@interface HMIconBindViewController ()<HMHasBindViewDelegate>

@end

@implementation HMIconBindViewController
{
    BOOL       _isEmail;
    NSString  *_number;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSString *pageName;
    if (_isEmail) {
        pageName = MTAPageChangeBindedEmail;
    }else{
        pageName = MTAPageChangeBindedPhone;
    }
    [self MTAViewBeginWithName:pageName];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSString *pageName;
    if (_isEmail) {
        pageName = MTAPageChangeBindedEmail;
    }else{
        pageName = MTAPageChangeBindedPhone;
    }
    [self MTAViewEndWithName:pageName];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupNavigationBar];
    HMHasBindView *view = [[HMHasBindView alloc] initWithFrame:CGRectMake(0, 64*VProportion, ScreenWidth, ScreenHeight-64*VProportion) email:_isEmail numberStr:_number delegate:self];
    [self.view addSubview:view];
}

-(instancetype)initWithEmail:(BOOL)isEmail oldNumberStr:(NSString *)numberStr
{
    self = [super init];
    if (self) {
        _isEmail = isEmail;
        _number = numberStr;
    }
    return self;
}
-(void)setupNavigationBar
{
    NSString *titleStr;
    if (_isEmail) {
        titleStr = NSLocalizedString(@"BindingMailbox", nil);
    }else{
        titleStr = NSLocalizedString(@"boundPhoneNumber", nil);
    }
    self.view.backgroundColor = CommonBgColor;
    NSDictionary *dic = [[NSDictionary alloc] initWithObjects:@[titleStr,@"backButton.png",CommonGreenColor] forKeys:@[Navi_Title,Navi_LeftImgNormal,Navi_BarBackgroundColor]];
    [self customizeNaviBarForDictionary:dic barType:navi_OnlyLeftBtn];

    
}

#pragma mark -HMHasBindViewDelegate
-(void)clickReplaceBindingButton
{
    HMSecurityVerificationViewController *SVViewCtl = [[HMSecurityVerificationViewController alloc] init];
    [SVViewCtl setOldNumber:_number isEmail:_isEmail isSV:YES isBind:YES];
    [self.navigationController pushViewController:SVViewCtl animated:YES];
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
