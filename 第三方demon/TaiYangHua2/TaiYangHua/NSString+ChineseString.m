//
//  NSString+ChineseString.m
//  TestProductForTableView
//
//  Created by HHLY on 16/1/18.
//  Copyright © 2016年 HHLY. All rights reserved.
//

#import "NSString+ChineseString.h"

@implementation NSString (ChineseString)

- (NSString *)pinyinStringOfChinese
{
//  kCFStringTransformMandarinLatin:带音标字母
//  kCFStringTransformStripDiacritics: 添加这步可以变为不带音标的拼音
    CFMutableStringRef string = CFStringCreateMutableCopy(NULL, 0, (__bridge CFStringRef)self);
    CFStringTransform(string, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform(string, NULL, kCFStringTransformStripDiacritics, NO);
    
    return (__bridge NSString *)string;
}

- (char)firstChar
{
    return self.length?[self characterAtIndex:0]:'#';
}

@end
