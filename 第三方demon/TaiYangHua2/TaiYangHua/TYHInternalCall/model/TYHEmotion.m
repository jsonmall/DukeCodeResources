//
//  TYHEmotion.m
//  TaiYangHua
//
//  Created by Lc on 16/2/26.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "TYHEmotion.h"

@implementation TYHEmotion

+ (instancetype)emotionWithDict:(NSDictionary *)dict
{
    TYHEmotion *emotion = [[TYHEmotion alloc] init];
    emotion.chs = dict[@"chs"];
    emotion.png = dict[@"png"];
    
    return emotion;
}

@end
