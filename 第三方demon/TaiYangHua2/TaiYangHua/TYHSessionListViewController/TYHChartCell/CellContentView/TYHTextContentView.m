//
//  TYHTextContentView.m
//  TaiYangHua
//
//  Created by Vieene on 16/2/19.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "TYHTextContentView.h"
#import "TYHChartContentView.h"
#import "UIView+Frame.h"
#import "MLExpressionManager.h"
#import "NSString+MLExpression.h"

@interface TYHTextContentView ()

@property (nonatomic,strong) TYHChartContentView *chartView;

@end

@implementation TYHTextContentView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _chartView = [[TYHChartContentView alloc]init];
        [self addSubview:_chartView];
        _chartView.userInteractionEnabled = NO;
    }
    return self ;
}

- (void)setFontColor
{
    if (_chartView.chartMessage.fromToType == kMessageTo ) {
        _chartView.contentLabel.textColor = [UIColor blackColor];
    }else{
        _chartView.contentLabel.textColor = [UIColor whiteColor];

    }
}

-(void)setBackGroundImageViewImage:(TYHChartContentView *)chartView from:(NSString *)from to:(NSString *)to
{
    UIImage *normal=nil ;
    if(chartView.chartMessage.fromToType==kMessageFrom){
        normal = [UIImage imageNamed:from];
    }else if(chartView.chartMessage.fromToType==kMessageTo){
        normal = [UIImage imageNamed:to];
    }
    chartView.backImageView.image = normal;
}

- (void)setupData
{
    _chartView.chartMessage = self.cellFrame.chartMessage;
    [self setFontColor];
    [self setBackGroundImageViewImage:_chartView from:@"chatfrom_bg_normal" to:@"chatto_bg_normal"];
    MLExpression *exp = [MLExpression expressionWithRegex:@"\\[[a-zA-Z0-9\\u4e00-\\u9fa5]+\\]" plistName:@"expression" bundleName:@"ClippedExpression"];
    self.chartView.contentLabel.attributedText = [self.cellFrame.chartMessage.wds expressionAttributedStringWithExpression:exp];
    _chartView.width = self.cellFrame.bubbleViewFrame.size.width;
    _chartView.height = self.cellFrame.bubbleViewFrame.size.height;
    
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
   
        [self.delegate chartCellLongPress:self content:self.cellFrame indexPath:self.index];}
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}

@end
