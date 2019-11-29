//
//  TYHChartCellFrame.h
//  TaiYangHua
//
//  Created by Vieene on 16/1/22.
//  Copyright © 2016年 hhly. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "TYHChartMessage.h"
extern CGFloat imageViewH ;
extern CGFloat imageViewW ;
@interface TYHChartCellFrame : NSObject
@property (nonatomic,strong) TYHChartMessage *chartMessage;

@property (nonatomic,assign) CGRect iconRect;
@property (nonatomic,assign) CGRect bubbleViewFrame;
@property (nonatomic, assign) CGFloat cellHeight; //cell高度
@end
