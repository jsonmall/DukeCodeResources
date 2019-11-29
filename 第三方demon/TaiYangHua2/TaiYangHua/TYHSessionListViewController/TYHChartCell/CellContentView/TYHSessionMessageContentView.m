//
//  TYHSessionMessageContentView.m
//  TaiYangHua
//
//  Created by Vieene on 16/1/22.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "TYHSessionMessageContentView.h"
//#import "NIMMessageModel.h"
#import "UIImage+NIM.h"
@implementation TYHSessionMessageContentView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sigleTapGestureRecognizerHandle:)];
        [self addGestureRecognizer:tapGestureRecognizer];
        [self addGestureRecognizer: [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longTap:)]];
    
    }
    return self;

}
- (void)sigleTapGestureRecognizerHandle:(UITapGestureRecognizer *)tapGestureRecognizer {
    DDLogError(@"子类没有重写该方法！！！");

}
-(void)longTap:(UILongPressGestureRecognizer *)tapGestureRecognizer
{
    DDLogError(@"子类没有重写该方法！！！");

}

- (void)setupData
{
    DDLogError(@"子类没有重写该方法！！！");
}


- (void)layoutSubviews{
    [super layoutSubviews];
}

- (UIImage *)notifyBubbleImageForState:(UIControlState)state
{
    return [[UIImage nim_imageInKit:@"icon_session_time_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(8,20,8,20) resizingMode:UIImageResizingModeStretch];
}



- (void)setHighlighted:(BOOL)highlighted{
    [super setHighlighted:highlighted];
    _bubbleImageView.highlighted = highlighted;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
}


@end
