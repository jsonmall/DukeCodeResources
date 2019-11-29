//
//  TestViewController.m
//  CloudPlatform
//
//  Created by liqiang on 15/7/16.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "TestViewController.h"


@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSDictionary *dic = [[NSDictionary alloc] initWithObjects:@[NSLocalizedString(@"Add_Device", nil),@"backButton.png",CommonGreenColor] forKeys:@[Navi_Title,Navi_LeftImgNormal,Navi_BarBackgroundColor]];
    [self customizeNaviBarForDictionary:dic barType:navi_OnlyLeftBtn];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)leftBtnClick:(UIButton *)click {
    CustomNavigationController * controller = (CustomNavigationController *)self.navigationController.presentingViewController;

    DLog(@"%@  %@",self.navigationController.presentingViewController,[controller.viewControllers objectAtIndex:0]);
    
        [self dismissViewControllerAnimated:NO completion:^{
            
        }];
        
        [controller dismissViewControllerAnimated:YES completion:^{
            
        }];
         
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

