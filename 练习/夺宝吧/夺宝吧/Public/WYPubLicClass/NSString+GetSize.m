//
//  NSString+GetSize.m
//  夺宝吧
//
//  Created by xiaocai on 15/7/20.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "NSString+GetSize.h"

@implementation NSString (GetSize)
//返回字符串所占用的尺寸.
-(CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}
@end
