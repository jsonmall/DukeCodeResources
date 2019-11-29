//
//  UIView+category.h
//  朋友圈发现
//
//  Created by GPsmile on 16/5/27.
//  Copyright © 2016年 gpsmile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (category)
/**
根据图片的张数和图片本身的大小来计算尺寸
**/
-(CGSize)photosViewSizeWithPhotosCount:(NSInteger)count image:(UIImage *)image;
@end
