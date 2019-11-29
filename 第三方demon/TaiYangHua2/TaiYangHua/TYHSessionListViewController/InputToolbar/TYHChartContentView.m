//
//  TYHChartContentView.m
//  气泡
//
//  Created by Vieene on 15-5-13.
//  Copyright (c) 2015年 hhly. All rights reserved.
//
#define kContentStartMargin 25
#import "TYHChartContentView.h"
#import "TYHChartMessage.h"
 CGFloat ChartCellContentFont = 15;
@implementation TYHChartContentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backImageView=[[UIImageView alloc]init];
        self.backImageView.userInteractionEnabled=YES;
        [self addSubview:self.backImageView];
        
        self.contentLabel=[[UILabel alloc]init];
        self.contentLabel.numberOfLines=0;
        self.contentLabel.textAlignment=NSTextAlignmentLeft;
        self.contentLabel.font=[UIFont fontWithName:@"HelveticaNeue" size:ChartCellContentFont];
        [self addSubview:self.contentLabel];
    }
    return self;
}
-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    self.backImageView.frame=self.bounds;
    CGFloat contentLabelX=0;
    if(self.chartMessage.fromToType==kMessageFrom){
        contentLabelX=kContentStartMargin*0.85;
    }else if(self.chartMessage.fromToType==kMessageTo){
        contentLabelX=kContentStartMargin*0.5;
    }
    self.contentLabel.frame=CGRectMake(contentLabelX, 0, self.frame.size.width-kContentStartMargin-5, self.frame.size.height);
}

@end
