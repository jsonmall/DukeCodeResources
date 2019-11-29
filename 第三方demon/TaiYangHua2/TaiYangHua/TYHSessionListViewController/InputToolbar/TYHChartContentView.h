//
//  TYHChartContentView.h
//  气泡
//
//  Created by Vieene on 14-5-13.
//  Copyright (c) 2015年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>



extern CGFloat ChartCellContentFont;

@interface TYHChartContentView : UIView
@property (nonatomic,strong) UIImageView *backImageView;
@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) TYHChartMessage *chartMessage;

@end
