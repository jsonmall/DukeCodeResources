//
//  TiShiView.m
//  夺宝吧
//
//  Created by xiaocai on 15/8/3.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "TiShiView.h"

@interface TiShiView ()
{
    __weak IBOutlet UIImageView *img;
    __weak IBOutlet UIButton *showBtn;
    
    __weak IBOutlet UIView *bgView;
}
@end
@implementation TiShiView

- (void)awakeFromNib{
    self.backgroundColor = QBB_GRAY_COLOR;
    showBtn.layer.cornerRadius = 2;
    showBtn.layer.masksToBounds = YES;
    
    //加载导航条
    [self loadCustomNaviBar];
}
//加载导航条
- (void)loadCustomNaviBar
{
    UIView *naviBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WYMWITH, 20+44)];
    naviBar.backgroundColor = QBB_RED_COLOR;
    //返回按钮
    UIButton *backBtn = [UIButton buttonWithType:0];
    backBtn.frame = CGRectMake(10, 25, 30, 30);
    [backBtn setImage:[UIImage imageNamed:@"icon_back_white_press"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [naviBar addSubview:backBtn];
        //标题
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 25)];
    titleLab.center = CGPointMake(WYMWITH/2, 42);
    titleLab.text = @"晒单有奖";
    titleLab.font = [UIFont systemFontOfSize:TITLE_SIZE];
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.textColor = [UIColor whiteColor];
    //分割线
    UILabel *fenge = [[UILabel alloc]initWithFrame:CGRectMake(0, 63.5, WYMWITH, 0.5)];
    fenge.backgroundColor = [UIColor lightGrayColor];
    [naviBar addSubview:fenge];
    [naviBar addSubview:titleLab];
    [self addSubview:naviBar];
}
- (void)backBtnOnClick:(UIButton *)sender
{
    [self.father.navigationController popViewControllerAnimated:YES];
}


- (IBAction)showBtnOnClick:(id)sender {
    
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
