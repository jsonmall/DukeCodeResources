//
//  GetPhoneVC.m
//  夺宝吧
//
//  Created by xiaocai on 15/6/19.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "GetPhoneVC.h"
#import "ForGetPwdVC.h"
@interface GetPhoneVC ()
{
    __weak IBOutlet UITextField *countLab;
    
    __weak IBOutlet UIButton *nextBtn;
}
@end

@implementation GetPhoneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    nextBtn.layer.masksToBounds = YES;
    nextBtn.layer.cornerRadius = 2;
    //屏蔽键盘事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeKeyBoard)];
    [self.view addGestureRecognizer:tap];
}
//关闭键盘
- (void)closeKeyBoard
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}
//下一步按钮的监听事件
- (IBAction)nextBtn:(id)sender {
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    if (countLab.text.length == 0) {
        [WYPublic showMessageWithTitle:nil Msg:@"请输入手机号！"];
        return;
    }
    if ([WYPublic isPhoneNum:countLab.text]) {
        ForGetPwdVC *forgetVC = [[ForGetPwdVC alloc]init];
        forgetVC.phone = countLab.text;
//        [self presentViewController:forgetVC animated:YES completion:nil];
        [self.navigationController pushViewController:forgetVC animated:YES];
    }
}
//返回按钮的监听事件
- (IBAction)backBtnOnClick:(id)sender {
    
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
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

-(void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion{
    
    [self.presentingViewController dismissViewControllerAnimated:flag completion:completion];
}

@end
