//
//  UIView+Frame.h
//  UIView分类
//
//  Created by 二爷 on 13-09-26.
//  Copyright (c) 2013年 ErYe. All rights reserved.
//
// 注意：如果在分类中使用@property ,只会生成get/set方法的声明，不会生成实现以及添加下划线开头的属性

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGSize size;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat top;

@end
