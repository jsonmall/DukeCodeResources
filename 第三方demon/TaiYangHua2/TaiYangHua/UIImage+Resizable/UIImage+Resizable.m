//
//  UIImage+Resizable.m
//  UIImage 分类（图片拉伸不变形）
//
//  Created by 二爷 on 13-09-26.
//  Copyright (c) 2013年 ErYe. All rights reserved.
//

#import "UIImage+Resizable.h"

@implementation UIImage (Resizable)

/**
 *  设置图片如何拉伸, 定好四个边的内边距, 只拉伸里面的外面保持原状（实际是外边不变，内部来个平铺图片）
 *
 *  @param imageName 图片名
 *
 *  @return 拉伸后的图片
 */
+ (UIImage *)resizableImageWithName:(NSString *)imageName
{
    return [self resizableImageWithName:imageName leftRatio:0.5 topRatio:0.5];
}

/**
 *  生成拉伸后不变形的图片
 *
 *  @param imageName 图片名
 *  @param leftRatio
 *  @param topRatio
 *
 *  @return 拉伸后不变形的图片
 */
+ (UIImage *)resizableImageWithName:(NSString *)imageName leftRatio:(CGFloat)leftRatio topRatio:(CGFloat)topRatio
{
    UIImage *image = [UIImage imageNamed:imageName];
    CGSize imageSize = image.size;
    image = [image stretchableImageWithLeftCapWidth:imageSize.width * leftRatio topCapHeight:imageSize.height * topRatio];
    return image;
}

@end
