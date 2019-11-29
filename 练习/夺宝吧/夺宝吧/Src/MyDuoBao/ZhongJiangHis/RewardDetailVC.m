//
//  RewardDetailVC.m
//  夺宝吧
//
//  Created by xiaocai on 15/7/21.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "RewardDetailVC.h"
#import "ShiWuFooter.h"
#import "RewardsDetailHeader.h"
#import "XuNiView.h"
@interface RewardDetailVC ()

@end

@implementation RewardDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = QBB_GRAY_COLOR;
    [self loadCustomNaviBar];
}
//加载导航条
- (void)loadCustomNaviBar
{
    UIView *naviBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WYMWITH, 20+44)];
    naviBar.backgroundColor = QBB_RED_COLOR;
    //返回按钮
    PublicBackBtn *backBtn = [[PublicBackBtn alloc]initWithVC:self andBackType:pop Img:[UIImage imageNamed:@"icon_back_white_press"]];
    [naviBar addSubview:backBtn];
    //标题
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 25)];
    titleLab.center = CGPointMake(WYMWITH/2, 42);
    titleLab.text = @"中奖详情";
    titleLab.font = [UIFont systemFontOfSize:TITLE_SIZE];
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.textColor = [UIColor whiteColor];
    //分割线
    UILabel *fenge = [[UILabel alloc]initWithFrame:CGRectMake(0, 63.5, WYMWITH, 0.5)];
    fenge.backgroundColor = [UIColor lightGrayColor];
    [naviBar addSubview:fenge];
    [naviBar addSubview:titleLab];
    [self.view addSubview:naviBar];
}

- (void)setModel:(RewardModel *)model
{
    _model = model;
    UIScrollView *s = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, WYMWITH, WYMHEIGHT - 64)];
    RewardsDetailHeader *header = [[[NSBundle mainBundle]loadNibNamed:@"RewardsDetailHeader" owner:self options:nil]lastObject];
    header.frame = CGRectMake(0, 0, WYMWITH, header.frame.size.height);
    header.model = self.model;
    [s addSubview:header];
    
    if ([model.reward_is_virtual isEqualToString:@"0"]) {/*******实物商品**********/
        ShiWuFooter *footer = [[[NSBundle mainBundle]loadNibNamed:@"ShiWuFooter" owner:self options:nil] lastObject];
        footer.frame = CGRectMake(0, CGRectGetMaxY(header.frame), WYMWITH, footer.frame.size.height);
        footer.father = self;
        if (self.isMineFlag) {
            footer.isMineFlag = YES;
        }else{
            footer.isMineFlag = NO;
        }
        footer.model = self.model;
        [s addSubview:footer];
        s.contentSize = CGSizeMake(0, header.frame.size.height+footer.frame.size.height);
    }else{/**************虚拟商品*************/
        XuNiView *footer = [[[NSBundle mainBundle]loadNibNamed:@"XuNiView" owner:self options:nil] lastObject];
        footer.frame = CGRectMake(0, CGRectGetMaxY(header.frame), WYMWITH, footer.frame.size.height);
        footer.father = self;
        if (self.isMineFlag) {
            footer.isMineFlag = YES;
        }else{
            footer.isMineFlag = NO;
        }
        footer.model = self.model;
        [s addSubview:footer];
        s.contentSize = CGSizeMake(0, header.frame.size.height+footer.frame.size.height);

    }
    
    [self.view addSubview:s];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
