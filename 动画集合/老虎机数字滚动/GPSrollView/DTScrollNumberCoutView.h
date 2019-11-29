//
//  DTScrollNumberCoutView.h
//  GPSrollView
//
//  Created by 郭大侠 on 2018/4/19.
//  Copyright © 2018年 郭大侠. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTScrollNumberCoutView : UIView

// 内容相关
@property (nonatomic, strong) NSNumber *number;
// 样式相关
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, assign) NSUInteger density;               // 滚动数字的密度
@property (nonatomic, assign) NSUInteger minLength;             // 最小显示长度，不够补零
// 动画相关
@property (nonatomic, assign) NSTimeInterval duration;          // 动画总持续时间
@property (nonatomic, assign) NSTimeInterval durationOffset;    // 相邻两个数字动画持续时间间隔
@property (nonatomic, assign) BOOL isAscending;                 // 方向，默认为NO，向下

@property (nonatomic, strong) UIImageView *backGroudimageView;    //背景图

@property (nonatomic, strong) UIImage *numberBackImage;    //数字背景图

@property (nonatomic, strong) UIImage *numbermaskBackImage;    //数字遮罩背景图

- (void)reloadView;
- (void)startAnimation;
- (void)stopAnimation;

@end


@interface DTDigitNumberView : UIView

@property (nonatomic, strong) UIImageView *numberbgImageView;

@property (nonatomic, strong) UIImageView *numbermaskImageView;

@property (nonatomic, strong) UILabel *numberLable;

- (void)configuer;

@end
