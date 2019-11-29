//
//  UIImage+Tool.m
//  UIImage 分类（抓图工具）
//
//  Created by 二爷 on 13-09-26.
//  Copyright (c) 2013年 ErYe. All rights reserved.
//

#import "UIImage+Tool.h"

@implementation UIImage (Tool)

/**
 *  将指定的视图（view）抓图生成image (截图工具)
 *
 *  @param view 制定要抓取的视图
 *
 *  @return 返回截得的图片
 */
+ (UIImage *)captureImageFromView:(UIView *)view
{
    // 创建图像上下文
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);
    // 获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 将视图的内容渲染到上下文中
    [view.layer renderInContext:ctx];
    // 从上下文中取出图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    // 返回图片
    return image;
}

@end
