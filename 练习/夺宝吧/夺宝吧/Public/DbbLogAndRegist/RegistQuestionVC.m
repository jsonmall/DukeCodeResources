//
//  RegistQuestionVC.m
//  夺宝吧
//
//  Created by xiaocai on 15/8/7.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "RegistQuestionVC.h"

@interface RegistQuestionVC ()

@end

@implementation RegistQuestionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backBtnOnclick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//- (IBAction)jiaqun:(id)sender {
//    [self joinGroup:@"123" key:@"321"];
//    
//}
////一键加群
//- (BOOL)joinGroup:(NSString *)groupUin key:(NSString *)key{
//    NSString *urlStr = [NSString stringWithFormat:@"mqqapi://card/show_pslcard?src_type=internal&version=1&uin=%@&key=%@&card_type=group&source=external", @"209365467",@"86ec5356174a708b024db7101d52693a4eab1c4d4c783d5a82e825598de33fde"];
//    NSURL *url = [NSURL URLWithString:urlStr];
//    if([[UIApplication sharedApplication] canOpenURL:url]){
//        [[UIApplication sharedApplication] openURL:url];
//        return YES;
//    }else{
//        UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"温馨提示：" message:@"未安装qq,或者安装的版本不支持！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
//        [alt show];
//    }
//    return NO;
//}
@end
