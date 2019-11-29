//
//  TwoViewController.m
//  ReactiveLearn
//
//  Created by GPsmile on 16/10/9.
//  Copyright © 2016年 gpsmile. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()




@end

@implementation TwoViewController
- (void)loadView
{
    [super loadView];
    self.view = [[[NSBundle mainBundle] loadNibNamed:@"TwoViewController" owner:nil options:nil] lastObject];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *nunbers = @[@1,@2,@3,@4];
    [nunbers.rac_sequence.signal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];

}
- (IBAction)backButton:(UIButton *)sender {
  //通知第一个控制器，告诉它被点击了进行穿值
    if (self.delegateSingal) {
        [self.delegateSingal sendNext:@"back"];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
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
