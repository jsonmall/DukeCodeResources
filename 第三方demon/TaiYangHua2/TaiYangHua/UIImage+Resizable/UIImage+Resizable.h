 //
//  UIImage+Resizable.h
//  UIImage 分类（图片拉伸不变形）
//
//  Created by 二爷 on 13-09-26.
//  Copyright (c) 2013年 ErYe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Resizable)

/**
 *  获取拉伸不变形的图片
 *
 *  @param imageName 图片名称
 *
 *  @return 拉伸不变形的图片, 默认传入宽高都是0.5
 */
+ (UIImage *)resizableImageWithName:(NSString *)imageName;

/**
 *  获取拉伸不变形的图片
 *
 *  @param imageName 图片名称
 *
 *  @return 拉伸不变形的图片
 */
+ (UIImage *)resizableImageWithName:(NSString *)imageName leftRatio:(CGFloat)leftRatio topRatio:(CGFloat)topRatio;

@end
