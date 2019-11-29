//
//  TestMeController.m
//  XMProfileController
//
//  Created by sfk-ios on 2018/4/27.
//  Copyright © 2018年 aiq西米. All rights reserved.
//

#import "TestMeController.h"

#warning  !! 继承自sub class of: XMProfileController
@interface TestMeController ()
/// 头像
@property (weak, nonatomic) UIImageView *iconView;
/// 昵称
@property (weak, nonatomic) UILabel *nameL;
@end

@implementation TestMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self setupUI];
  
    // 头像
    self.iconView.image = [UIImage imageNamed:@"girl.jpg"];
    // 头部背景图（正方形，宽高=屏幕宽）
    self.headerImageView.image = self.iconView.image;
    
    self.nameL.text = @"美腿小姐姐";
    self.titleLabel.text = self.nameL.text;
    [self.titleLabel sizeToFit];
}


- (void)setupUI{
    
    // 头像
    UIImageView *iconView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.headerView.xm_width*0.2, self.headerView.xm_width*0.2)];
    iconView.layer.cornerRadius = iconView.xm_width *0.5;
    iconView.layer.borderColor = [UIColor whiteColor].CGColor;
    iconView.layer.borderWidth = 0.5;
    iconView.layer.masksToBounds = YES;
    [self.headerView addSubview:iconView];
    iconView.xm_centerX = self.headerView.xm_width *0.5;
    iconView.xm_centerY = self.headerView.xm_height *0.5;
    self.iconView = iconView;
    
    // 昵称
    UILabel *nameL = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(iconView.frame)+10, self.headerView.xm_width, 30)];
    nameL.textAlignment = NSTextAlignmentCenter;
    nameL.textColor = [UIColor whiteColor];
    nameL.font = [UIFont systemFontOfSize:16];
    [self.headerView addSubview:nameL];
    self.nameL = nameL;
}

@end
