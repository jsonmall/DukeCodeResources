//
//  ChangePwdVC.m
//  夺宝吧
//
//  Created by xiaocai on 15/6/19.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "ChangePwdVC.h"
//重置密码URL
#define CHANGE_PWD_URL @"/api/ApiUser/resetPassword"
@interface ChangePwdVC ()
{
    __weak IBOutlet UITextField *pwdLab;
    __weak IBOutlet UITextField *ensurePwdLab;
    __weak IBOutlet UIButton *commitBtn;
}
@end

@implementation ChangePwdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    commitBtn.layer.masksToBounds = YES;
    commitBtn.layer.cornerRadius = 2;
    pwdLab.secureTextEntry = YES;
    ensurePwdLab.secureTextEntry = YES;
    //屏蔽键盘事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeKeyBoard)];
    [self.view addGestureRecognizer:tap];
}
//关闭键盘
- (void)closeKeyBoard
{
    
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//完成按钮的监听事件
- (IBAction)commitBtnOnClick:(id)sender {
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    [WYPublic addZheZhaoToWindowWithTitle:nil];
    NSDictionary *params = @{@"account":self.phone,@"verify_code":self.yzm,@"password":pwdLab.text,@"confirm_password":ensurePwdLab.text,@"auto_login":@"1"};
    [WYRequest startPostForDicWithUrlStR:[NSString stringWithFormat:@"%@%@",DBB_IP,CHANGE_PWD_URL] Parameters:params successBlock:^(NSDictionary *dic) {
        NSNumber *ret = dic[@"ret"];
        if (ret.intValue == 0) {
            //保存用户信息
            NSDictionary *userinfo = dic[@"data"];
            [UserInfo writeUserInfoWithDic:userinfo];
            NSInteger index = 2;
            NSString *show_shopping = [[NSUserDefaults standardUserDefaults] valueForKey:@"show_shopping"];
            if (show_shopping.integerValue == 1) {
                //显示
                index = 3;
            }
            [[WYMainTabBarVC shareMainTaBarVC] changeSelectedWithIndex:index];
            //退出登录界面
//            [WYPublic logOrRegistSuccess];
            [WYPublic showMessageWithTitle:nil Msg:@"修改成功"];
            [self dismissViewControllerAnimated:YES completion:nil];

        }else{
            [WYPublic showMessageWithTitle:nil Msg:dic[@"msg"]];
        }
        [WYPublic removeZheZhaoToWindow];
    } failedBlock:^{
        [WYPublic removeZheZhaoToWindow];
    } needLog:NO];
}

//返回按钮的监听事件
- (IBAction)backBtnOnClick:(id)sender {
    
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
