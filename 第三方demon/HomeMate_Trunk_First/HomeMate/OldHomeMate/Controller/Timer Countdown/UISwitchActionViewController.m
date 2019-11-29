//
//  UISwitchActionViewController.m
//  CloudPlatform
//
//  Created by orvibo on 15/5/14.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "UISwitchActionViewController.h"

@interface UISwitchActionViewController ()

@end

@implementation UISwitchActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupNavigationBar];
    __weak UISwitchActionViewController *wself = self;
    UISwitchActionView *switchActionView = [[UISwitchActionView alloc] initWithFrame:CGRectMake(0, 64*VProportion, ScreenWidth, ScreenHeight-64*VProportion) actionBlock:^(UIButton *sender) {
        if (wself.delegate && [wself.delegate respondsToSelector:@selector(didSelectedAction: tip:)]) {
            [wself.delegate didSelectedAction:sender.tag tip:(sender.tag == KOpen)? NSLocalizedString(@"Open", nil) : NSLocalizedString(@"Close", nil)];
        }
        [wself.navigationController popViewControllerAnimated:YES];
    }];
    [self.view addSubview:switchActionView];
}
-(void)setupNavigationBar
{
    NSDictionary *dic = [[NSDictionary alloc] initWithObjects:@[NSLocalizedString(@"Localizeble_setAction", nil),@"backButton.png",CommonGreenColor] forKeys:@[Navi_Title,Navi_LeftImgNormal,Navi_BarBackgroundColor]];
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
