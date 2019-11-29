//
//  PublicBackBtn.m
//  夺宝吧
//
//  Created by xiaocai on 15/6/25.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "PublicBackBtn.h"

@interface PublicBackBtn ()
{
    //记录vc
  __weak  UIViewController *_vc;
    //记录返回的方式
    BackType _backType;
}
@end
@implementation PublicBackBtn

//获取实例的方法
- (instancetype)initWithVC:(UIViewController *)vc andBackType:(BackType)type Img:(UIImage *)img
{
    if (self = [super init]) {
        self.frame = CGRectMake(10, 25, 30, 30);
        _vc = vc;
        _backType = type;
        [self setImage:img forState:UIControlStateNormal];
        [self addTarget:self action:@selector(backBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (void)backBtnOnClick:(UIButton *)sender
{
    if (_backType == dismiss) {
        [_vc dismissViewControllerAnimated:YES completion:nil];
    }else{
        [_vc.navigationController popViewControllerAnimated:YES];
    }
}
@end
