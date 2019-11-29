//
//  UIView+category.m
//  朋友圈发现
//
//  Created by GPsmile on 16/5/27.
//  Copyright © 2016年 gpsmile. All rights reserved.
//

#import "UIView+category.h"

@implementation UIView (category)
static CGSize onePhotoSize;
static CGFloat photoDefaultWH;
static CGFloat onePhotoH;
-(CGSize)photosViewSizeWithPhotosCount:(NSInteger)count image:(UIImage *)image
{
    if (iPhone5 || iPhone4S) {
        photoDefaultWH = 70;
        onePhotoH = 120;
    } else if(iPhone6s) {
        photoDefaultWH = 90;
        onePhotoH = 140;
    } else if(iPhone6SP) {
        photoDefaultWH =105;
        onePhotoH = 160;
    }
    
    if (count==1) {
        CGFloat onePhotoW=onePhotoH*image.size.height/(CGFloat)image.size.width;
        return CGSizeMake(onePhotoW, onePhotoH);
    }
    NSInteger maxColumns=(count==4) ? 2:3;
    NSInteger rows=(count+maxColumns-1)/maxColumns;
    CGFloat photoH=rows*photoDefaultWH+(rows-1)*5;
    NSInteger cols=(count>=maxColumns) ? maxColumns:count;
    CGFloat photosW=cols *photoDefaultWH +(cols-1)*5;
    if (photoH<=0) {
        photoH=0;
    }
    return CGSizeMake(photosW, photoH);
}

@end
