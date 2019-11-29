//
//  TYHChartCellFrame.m
//  TaiYangHua
//
//  Created by Vieene on 16/1/22.
//  Copyright © 2016年 hhly. All rights reserved.
//

#define kIconMarginX 2
#define kIconMarginY 5
#import "NSString+TextSize.h"
#import "TYHChartCellFrame.h"
#import "TYHChartContentView.h"
#import "TYHChartTipsCell.h"
#import "MLExpressionManager.h"
#import "NSString+MLExpression.h"
@implementation TYHChartCellFrame
CGFloat imageViewH = 160;
CGFloat imageViewW = 120;


-(void)setChartMessage:(TYHChartMessage *)chartMessage
{
    _chartMessage=chartMessage;
    
    CGSize winSize=[UIScreen mainScreen].bounds.size;
    CGFloat iconX=kIconMarginX;
    CGFloat iconY=kIconMarginY;
    CGFloat iconWidth=40;
    CGFloat iconHeight=40;
    CGFloat voiceX;
    CGFloat voicew = 90;
    CGFloat voiceh = 40;
  
    CGFloat imageX;
    if(chartMessage.fromToType==kMessageFrom){
      
    }else if (chartMessage.fromToType==kMessageTo){
        iconX=winSize.width-kIconMarginX-iconWidth;
    }
    self.iconRect=CGRectMake(iconX, iconY, iconWidth, iconHeight);
    //_iconRect	CGRect	(origin = (x = 5, y = 5), size = (width = 40, height = 40))
    CGFloat contentX=CGRectGetMaxX(self.iconRect)+kIconMarginX;
    voiceX = CGRectGetMaxX(self.iconRect) + kIconMarginX;
    imageX = CGRectGetMaxX(self.iconRect) + kIconMarginX;

    CGFloat contentY=iconY;
    
    MLExpression *exp = [MLExpression expressionWithRegex:@"\\[[a-zA-Z0-9\\u4e00-\\u9fa5]+\\]" plistName:@"expression" bundleName:@"ClippedExpression"];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithAttributedString:[chartMessage.wds expressionAttributedStringWithExpression:exp]];
    
    [string addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue" size:ChartCellContentFont] range:NSMakeRange(0, string.length)];
    
    CGSize contentSize = [string boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;

    if(chartMessage.fromToType==kMessageTo){
        contentX=iconX-kIconMarginX-contentSize.width - 35;
        voiceX = iconX-kIconMarginX-voicew;
        imageX = iconX-imageViewW - kIconMarginX ;

    }

    switch (chartMessage.itp) {
        case MessageTypeVoice:
        {
            self.bubbleViewFrame = CGRectMake(voiceX, contentY, voicew, voiceh);
            self.cellHeight=MAX(CGRectGetMaxY(self.iconRect), CGRectGetMaxY(self.bubbleViewFrame))+20;
        }break;
            case MessageTypeImage:
        {
            self.bubbleViewFrame = CGRectMake(imageX, contentY, imageViewW, imageViewH);
            self.cellHeight=MAX(CGRectGetMaxY(self.iconRect), CGRectGetMaxY(self.bubbleViewFrame))+10;
        }break;
        case MessageTypeText:{
            self.bubbleViewFrame=CGRectMake(contentX, contentY, contentSize.width+35, contentSize.height + 23);
            self.cellHeight=MAX(CGRectGetMaxY(self.iconRect), CGRectGetMaxY(self.bubbleViewFrame)) + 20 ;
        }break;
            case MessageTypeJudge:
        {
            self.bubbleViewFrame=CGRectMake(contentX, contentY, contentSize.width+35, contentSize.height+20);
            self.cellHeight=MAX(CGRectGetMaxY(self.iconRect), CGRectGetMaxY(self.bubbleViewFrame))+10;
        }break;
        case MessageTypeTips:{
            CGFloat W = SCREEN_W - TipsCellcontainerLeft - TipsCellcontaineRight - TipsCellLabelLeft - TipsCellLabelRight;
            CGFloat H =  [chartMessage.wds sizeWithFont:fontSize24 MaxSize:CGSizeMake(W, MAXFLOAT)].height;
            self.cellHeight = H + TipsCellcontainerTop + TipsCellcontainerBottom + TipsCellLabelTop + TipsCellLabelBottom + 5;
        }break;
        case MessageTypeEnd:{
            self.bubbleViewFrame=CGRectMake(contentX, contentY, contentSize.width+35, contentSize.height + 23);
            self.cellHeight=MAX(CGRectGetMaxY(self.iconRect), CGRectGetMaxY(self.bubbleViewFrame)) + 20 ;
        }break;
            default:
        {
            DDLogError(@"未知的消息类型");
        }break;
    }
}

@end
