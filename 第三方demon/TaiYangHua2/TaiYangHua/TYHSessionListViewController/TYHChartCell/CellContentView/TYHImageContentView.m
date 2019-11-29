//
//  TYHImageContentView.m
//  TaiYangHua
//
//  Created by Vieene on 16/2/20.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "TYHImageContentView.h"
#import "ImageCellView.h"

@interface TYHImageContentView ()


@end
@implementation TYHImageContentView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _photoView = [[ImageCellView alloc]init];
        [self addSubview:_photoView];
        _photoView.userInteractionEnabled = YES;
     }
    return self ;
}

-(void)setImageCellBackGroundImageViewImage:(ImageCellView *)ImageCellView from:(NSString *)from to:(NSString *)to
{
    UIImage *normal=nil ;
    if(ImageCellView.chartMessage.fromToType==kMessageFrom){
        normal = [UIImage imageNamed:from];
    }else if(ImageCellView.chartMessage.fromToType==kMessageTo){
        normal = [UIImage imageNamed:to];
    }
    ImageCellView.image=normal;
}

- (void)setupData
{
    _photoView.chartMessage = self.cellFrame.chartMessage;
    [self setImageCellBackGroundImageViewImage:_photoView from:@"chatfrom_bg_normal" to:@"chatto_bg_normal"];
    _photoView.width = self.cellFrame.bubbleViewFrame.size.width;
    _photoView.height = self.cellFrame.bubbleViewFrame.size.height;

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


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
}

@end
