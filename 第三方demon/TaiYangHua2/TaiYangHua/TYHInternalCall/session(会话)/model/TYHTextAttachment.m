//
//  TYHTextAttachment.m
//  TaiYangHua
//
//  Created by Lc on 16/2/26.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "TYHTextAttachment.h"
#import "TYHEmotion.h"

@implementation TYHTextAttachment
- (void)setEmotion:(TYHEmotion *)emotion
{
    _emotion = emotion;
    self.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", emotion.png]];
}
@end
