//
//  HJCarouselViewCell.m
//  HJCarouselDemo
//
//  Created by haijiao on 15/8/20.
//  Copyright (c) 2015年 olinone. All rights reserved.
//

#import "HJCarouselViewCell.h"

@implementation HJCarouselViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)makeStyle:(LXRoundStyle)style Corner:(CGFloat)roundCorner{
    //阴影，影响性能
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowRadius = 3.0f;
    self.layer.shadowOpacity = 1.0f;
    self.layer.masksToBounds = NO;
    
    switch (style) {
        case LXRoundStyle_Circle:
        {
            self.contentView.layer.cornerRadius = roundCorner;
            self.contentView.layer.masksToBounds = YES;
            self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:roundCorner].CGPath;
        }
            break;
            
        case LXRoundStyle_Heart:{
            UIBezierPath *maskPath = [[UIBezierPath alloc] init];
            [maskPath moveToPoint:CGPointMake(roundCorner, roundCorner*2/4.0)];
            //右半心
            [maskPath addCurveToPoint:CGPointMake(roundCorner, roundCorner*2) controlPoint1:CGPointMake(roundCorner*1.75, -0.5*roundCorner) controlPoint2:CGPointMake(roundCorner*2.5, roundCorner*1.25)];
            
            //左半心
            [maskPath addCurveToPoint:CGPointMake(roundCorner, roundCorner*2/4.0) controlPoint1:CGPointMake(-0.5*roundCorner, roundCorner*1.25)controlPoint2:CGPointMake(roundCorner*0.25, -0.5*roundCorner)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = self.bounds;
            maskLayer.path = maskPath.CGPath;
            self.contentView.layer.mask = maskLayer;
            self.layer.shadowPath = maskPath.CGPath;
            
        }
            break;
    }
}
@end
