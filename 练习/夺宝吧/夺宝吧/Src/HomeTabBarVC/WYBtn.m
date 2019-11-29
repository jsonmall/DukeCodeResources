//
//  WYBtn.m
//  夺宝吧
//
//  Created by xiaocai on 15/6/25.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "WYBtn.h"

@interface WYBtn ()
{
    //图片
    UIImageView *_btnImg;
    //文字
    UILabel *_btnLable;
    //记录两张图片
    UIImage *_norImg;
    UIImage *_pressImg;
}
@end
@implementation WYBtn

//获取实例的方法
- (instancetype)initWithFrame:(CGRect)frame AndImgNom:(UIImage *)nor AndImgPress:(UIImage *)pressImg AndTitle:(NSString *)title
{
    if (self = [super initWithFrame:frame]) {
        //图片
        _btnImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 28, 28)];
        _btnImg.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2-5);
        //记录图片
        _norImg = nor;
        _pressImg = pressImg;
        _btnImg.image = nor;
        //按钮名字
        _btnLable = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 14, self.frame.size.width, 12)];
        _btnLable.textAlignment = NSTextAlignmentCenter;
        _btnLable.textColor = [UIColor grayColor];
        _btnLable.text = title;
        _btnLable.font = [UIFont systemFontOfSize:10];
        [self addSubview:_btnImg];
        [self addSubview:_btnLable];
    }
    return self;
}
//改写set方法
- (void)setSel_flag:(BOOL)sel_flag
{
    _sel_flag = sel_flag;
    if (self.sel_flag) {
        _btnImg.image = _pressImg;
        _btnLable.textColor = QBB_RED_COLOR;
    }else{
        _btnImg.image = _norImg;
        _btnLable.textColor = [UIColor grayColor];
    }
}
//获取图片添加圆角通知
- (UIImageView *)getImgView
{
    return _btnImg;
}
@end
