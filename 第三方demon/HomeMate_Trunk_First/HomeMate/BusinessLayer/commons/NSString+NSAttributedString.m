//
//  NSString+NSAttributedString.m
//  HomeMate
//
//  Created by Air on 15/11/11.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "NSString+NSAttributedString.h"

@implementation NSString (NSAttributedString)

-(NSMutableAttributedString *)attributedStringWithColor:(UIColor *)color
{
    NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:color
                                                                forKey:NSForegroundColorAttributeName];
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:self
                                                                     attributes:attrsDictionary];
    return attrString;
}

@end
