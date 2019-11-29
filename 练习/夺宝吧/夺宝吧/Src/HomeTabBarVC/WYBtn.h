//
//  WYBtn.h
//  夺宝吧
//
//  Created by xiaocai on 15/6/25.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYBtn : UIControl
//是否选中属性
@property (nonatomic,assign)BOOL sel_flag;
//获取图片添加圆角通知
- (UIImageView *)getImgView;
//获取实例的方法
- (instancetype)initWithFrame:(CGRect)frame AndImgNom:(UIImage *)nor AndImgPress:(UIImage *)pressImg AndTitle:(NSString *)title;
@end
