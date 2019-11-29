//
//  TYHVoiceContentView.m
//  TaiYangHua
//
//  Created by Vieene on 16/2/20.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "TYHVoiceContentView.h"
#import "FSVoiceBubble.h"
@interface TYHVoiceContentView ()



@end
@implementation TYHVoiceContentView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _voiceView = [[FSVoiceBubble alloc]init];
        [self addSubview:_voiceView];
        _voiceView.userInteractionEnabled = YES;

    }
    return self ;
}
- (void)setupData
{
    _voiceView.width = self.cellFrame.bubbleViewFrame.size.width;
    _voiceView.height = self.cellFrame.bubbleViewFrame.size.height;
    self.voiceView.seconds = self.cellFrame.chartMessage.wds;
    if (self.cellFrame.chartMessage.fromToType == kMessageFrom) {
        self.voiceView.invert = NO;
    }else{
        self.voiceView.invert = YES;
    }
}


#pragma mark -- contentView手势
- (void)sigleTapGestureRecognizerHandle:(UITapGestureRecognizer *)tapGestureRecognizer {
    if (tapGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        if([self.delegate respondsToSelector:@selector(chartCellTapPress:content:indexPath:)]){
            [self.delegate chartCellTapPress:self content:self.cellFrame indexPath:self.index];
        }
    }
}
-(void)longTap:(UILongPressGestureRecognizer *)tapGestureRecognizer
{
    if([self.delegate respondsToSelector:@selector(chartCellLongPress:content:indexPath:)]){
        [self.delegate chartCellLongPress:self content:self.cellFrame indexPath:self.index];
    }
}
@end
