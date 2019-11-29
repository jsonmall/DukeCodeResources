//
//  NSString+category.m
//  朋友圈发现
//
//  Created by GPsmile on 16/5/27.
//  Copyright © 2016年 gpsmile. All rights reserved.
//

#import "NSString+category.h"

@implementation NSString (category)
-(CGRect)cgsizeRectWithFont:(CGFloat)font
{
    
    
    CGRect  rect=[self boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil];
    return rect;
    
}
@end
