//
//  ForGetPwdVC.m
//  夺宝吧
//
//  Created by xiaocai on 15/6/19.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "ForGetPwdVC.h"
#import "ChangePwdVC.h"
//获取验证码
#define YZM_URL @"/api/ApiUser/sendVerifyCode"
//检验验证码
#define CHECK_YZM_URL @"/api/ApiUser/checkVerifyCode"
@interface ForGetPwdVC ()
{
    __weak IBOutlet UIButton *yzmBtn;
    __weak IBOutlet UITextField *yzmLab;
    __weak IBOutlet UIButton *commitBtn;
    __weak IBOutlet UILabel *phoneNumLab;
    __weak IBOutlet UILabel *tishiLab1;
    
    //定时器
    NSTimer *timer;
    int seconds;
}
@end

@implementation ForGetPwdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //默认时间60秒
    seconds = 60;
    yzmBtn.layer.masksToBounds = YES;
    yzmBtn.layer.cornerRadius = 2;
    commitBtn.layer.masksToBounds = YES;
    commitBtn.layer.cornerRadius = 2;
    phoneNumLab.hidden = YES;
    phoneNumLab.text = self.phone;
    tishiLab1.hidden = YES;
    //屏蔽键盘事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeKeyBoard)];
    [self.view addGestureRecognizer:tap];
}
//关闭键盘
- (void)closeKeyBoard
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}
- (void)awakeFromNib
{
    self.view.frame = CGRectMake(0,0,WYMWITH, WYMHEIGHT);
}
//返回按钮的监听事件
- (IBAction)backBtnOnClick:(id)sender {
    
//    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
}
//下一步按钮
- (IBAction)nextBtnOnClick:(id)sender {
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    [WYPublic addZheZhaoToWindowWithTitle:nil];
    NSDictionary *params = @{@"account":self.phone,@"verify_code":yzmLab.text};
    [WYRequest startPostForDicWithUrlStR:[NSString stringWithFormat:@"%@%@",DBB_IP,CHECK_YZM_URL] Parameters:params successBlock:^(NSDictionary *dic) {
        NSNumber *ret = dic[@"ret"];
        if (ret.intValue == 0) {
            //跳往重置密码界面
            ChangePwdVC *changeVC = [[ChangePwdVC alloc]init];
            changeVC.phone = self.phone;
            changeVC.yzm = yzmLab.text;
//            [self presentViewController:changeVC animated:YES completion:nil];
            [self.navigationController pushViewController:changeVC animated:YES];
        }else{
            [WYPublic showMessageWithTitle:nil Msg:dic[@"msg"]];
        }
        [WYPublic removeZheZhaoToWindow];
    } failedBlock:^{
        [WYPublic removeZheZhaoToWindow];
    } needLog:NO];
}

//获取验证码按钮
- (IBAction)yzmBtnOnCLick:(id)sender {
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    yzmBtn.backgroundColor = [UIColor grayColor];
    [yzmBtn setTitle:@"60秒后重试" forState:UIControlStateNormal];
    yzmBtn.userInteractionEnabled = NO;
    NSDictionary *params = @{@"account":self.phone,@"check_account_exists":@"1",@"scenario":@"resetPasswordVerify"};
    [WYRequest startPostForDicWithUrlStR:[NSString stringWithFormat:@"%@%@",DBB_IP,YZM_URL] Parameters:params successBlock:^(NSDictionary *dic) {
        tishiLab1.hidden = NO;
        phoneNumLab.hidden = NO;
        NSNumber *ret = dic[@"ret"];
        if ([ret intValue]!=0) {
            [WYPublic showMessageWithTitle:@"" Msg:[WYPublic getUsefullStr:dic[@"msg"]]];
        }
    } failedBlock:^{
        
    } needLog:NO];
    //60秒倒计时
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:YES];

}
//倒计时方法验证码实现倒计时60秒，60秒后按钮变换开始的样子
-(void)timerFireMethod:(NSTimer *)theTimer {
    if (seconds == 1) {
        [theTimer invalidate];
        seconds = 60;
        [yzmBtn setTitle:@"获取验证码" forState: UIControlStateNormal];
        yzmBtn.userInteractionEnabled = YES;
        yzmBtn.backgroundColor = QBB_RED_COLOR;
    }else{
        seconds--;
        NSString *title = [NSString stringWithFormat:@"%d秒后重试",seconds];
        [yzmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [yzmBtn setTitle:title forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [timer invalidate];
}

-(void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion{
    [self.presentingViewController dismissViewControllerAnimated:flag completion:completion];
}
@end
