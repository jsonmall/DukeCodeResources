//
//  UIView+Frame.m
//  UIView分类
//
//  Created by 二爷 on 13-09-26.
//  Copyright (c) 2013年 ErYe. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

#pragma mark - x

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)top {
    return self.frame.origin.y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x
{
    CGRect tempRect = self.frame;
    self.frame = CGRectMake(x, tempRect.origin.y, tempRect.size.width, tempRect.size.height);
}
- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}
- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}


#pragma mark - y
- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y
{
    CGRect tempRect = self.frame;
    self.frame = CGRectMake(tempRect.origin.x, y, tempRect.size.width, tempRect.size.height);
}

#pragma mark - width
- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect tempRect = self.frame;
    self.frame = CGRectMake(tempRect.origin.x, tempRect.origin.y, width, tempRect.size.height);
}

#pragma mark - height
- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect tempRect = self.frame;
    self.frame = CGRectMake(tempRect.origin.x, tempRect.origin.y, tempRect.size.width, height);
}

#pragma mark - centerX
- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint tempPoint = self.center;
    self.center = CGPointMake(centerX, tempPoint.y);
}

#pragma mark - centerY
- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint tempPoint = self.center;
    self.center = CGPointMake(tempPoint.x, centerY);
}

#pragma mark - size
- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    CGRect tempRect = self.frame;
    self.frame = CGRectMake(tempRect.origin.x, tempRect.origin.y, size.width, size.height);
}

@end
