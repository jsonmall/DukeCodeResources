//
//  ChartCell.h
//  气泡
//
//  Created by zzy on 14-5-13.
//  Copyright (c) 2014年 zzy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TYHChartCellFrame.h"

@class TYHChartCellFrame;
@class TYHSessionMessageContentView;



@protocol ChartCellModelDelegate <NSObject>

- (void)onRetryMessage:(TYHChartCellFrame *)message;


@end

@interface TYHChartCell : UITableViewCell

@property (nonatomic,strong) TYHSessionMessageContentView *bubbleView;           //内容区域


@property (nonatomic,strong) UIActivityIndicatorView *traningActivityIndicator;  //发送loading
@property (nonatomic,strong) UIButton *retryButton;                              //重试
//@property (nonatomic, strong) NIMBadgeView *audioPlayedIcon;                      //语音未读红点

@property (nonatomic,strong) TYHChartCellFrame *cellFrame;

@property (nonatomic,weak)   id<ChartCellModelDelegate> messageDelegate;


- (void)setupDelegate:(id)vc;

/**
 *  刷新cell状态
 */
- (void)refreshData:(TYHChartMessage *)data;

@end
