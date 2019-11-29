//
//  ZBFaceView.m
//  MessageDisplay
//
//  Created by zhoubin@moshi on 14-5-13.
//  Copyright (c) 2014年 Crius_ZB. All rights reserved.
//

#import "ZBFaceView.h"

#define NumPerLine 7
#define Lines    3
//#define FaceSize  32
/*
 ** 两边边缘间隔
 */
#define EdgeDistance 20
/*
 ** 上下边缘间隔
 */
#define EdgeInterVal 5

@implementation ZBFaceView

- (id)initWithFrame:(CGRect)frame forIndexPath:(NSInteger)index
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat FaceSize = 0.0;
        FaceSize = 38;
        if (iPhone4S || iPhone5) {
            FaceSize = 33;
        };
        if (iPhone6s) {
            FaceSize = 35;
        }
        // 水平间隔
        CGFloat horizontalInterval = (CGRectGetWidth(self.bounds)-NumPerLine*FaceSize -2*EdgeDistance)/(NumPerLine-1);
        // 上下垂直间隔
        CGFloat verticalInterval = (CGRectGetHeight(self.bounds)-2*EdgeInterVal -Lines*FaceSize)/(Lines-1);
        
        for (int i = 0; i<Lines; i++)
        {
            for (int x = 0;x<NumPerLine;x++)
            {
                UIButton *expressionButton =[UIButton buttonWithType:UIButtonTypeCustom];
                [self addSubview:expressionButton];
                [expressionButton setFrame:CGRectMake(x*FaceSize+EdgeDistance+x*horizontalInterval,
                                                      i*FaceSize +i*verticalInterval+EdgeInterVal,
                                                      FaceSize,
                                                      FaceSize)];
                if (i*7+x+1 ==21) {
                    [expressionButton setBackgroundImage:[UIImage imageNamed:@"DeleteEmoticonBtn_ios7.png"]
                                                forState:UIControlStateNormal];
                    expressionButton.tag = 0;
                }else{
                    NSString *imageStr = [NSString stringWithFormat:@"1f%02zd.png",index*20+i*7+x+1];
                    NSString *imagePath = [@"ClippedExpression.bundle" stringByAppendingPathComponent:imageStr];
                    UIImage *image = [UIImage imageNamed:imagePath];
                    [expressionButton setBackgroundImage:image
                                                forState:UIControlStateNormal];
                    expressionButton.tag = 20*index+i*7+x+1;
                }
                [expressionButton addTarget:self
                                     action:@selector(faceClick:)
                           forControlEvents:UIControlEventTouchUpInside];
            }
        }
    }
    return self;
}

- (void)faceClick:(UIButton *)button{
    NSString *faceName;
    BOOL isDelete;
    if (button.tag ==0){
        faceName = nil;
        isDelete = YES;
    }else{
        NSString *plistStr = [[NSBundle mainBundle]pathForResource:@"expression" ofType:@"plist"];
        NSDictionary *plistDic = [[NSDictionary  alloc]initWithContentsOfFile:plistStr];
        
        NSString *expressKey = [NSString stringWithFormat:@"[1f%02zd]", button.tag];
        faceName = plistDic[expressKey] ? expressKey : @"";
        isDelete = NO;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelecteFace:andIsSelecteDelete:)]) {
        [self.delegate didSelecteFace:faceName andIsSelecteDelete:isDelete];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}
@end
