//
//  TYHInternalSessionEmotionCell.m
//  TaiYangHua
//
//  Created by Lc on 16/1/29.
//  Copyright © 2016年 hhly. All rights reserved.
//

#define column 9
#define row 3

#import "TYHInternalSessionEmotionCell.h"
#import "TYHEmotion.h"

@implementation TYHInternalSessionEmotionCell

- (void)setEmotions:(NSArray *)emotions
{
    _emotions = emotions;
    
    CGFloat width = 30;
    CGFloat height = width;

    CGFloat columnMargin = (self.contentView.width - width * column) / (column + 1);
    CGFloat rowMargin = (self.contentView.height - height * row) / (row + 1);
    
    for (int i = 0; i < self.emotions.count + 1; i++) {
        UIButton *button = [[UIButton alloc] init];
        
        CGFloat x = i % column * (width + columnMargin) + columnMargin;
        CGFloat y = i / column * (height + rowMargin) + rowMargin;
        button.frame = CGRectMake(x, y, width, height);
        
        if (i == self.emotions.count) {
            
            [button addTarget:self action:@selector(clickDeleteButton:) forControlEvents:UIControlEventTouchUpInside];
            [button setBackgroundImage:[UIImage imageNamed:@"DeleteEmoticonBtn_ios7"] forState:UIControlStateNormal];
            [self.contentView addSubview:button];
            
            return; 
        }
        
        TYHEmotion *emotion = self.emotions[i];

        [button addTarget:self action:@selector(clickEmotion:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", emotion.png]] forState:UIControlStateNormal];
        button.tag = i;
        [self.contentView addSubview:button];
    }
}

- (void)clickEmotion:(UIButton *)button
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    TYHEmotion *emotion = self.emotions[button.tag];
    dict[@"emotion"] = emotion;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"userClickEmotion" object:nil userInfo:dict];
}

- (void)clickDeleteButton:(UIButton *)button
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"didDeleteEmotion" object:nil];
}

@end
