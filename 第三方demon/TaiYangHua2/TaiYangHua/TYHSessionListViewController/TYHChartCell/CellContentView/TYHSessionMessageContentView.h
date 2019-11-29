//
//  TYHSessionMessageContentView.h
//  TaiYangHua
//
//  Created by Vieene on 16/1/22.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TYHChartCellFrame.h"


typedef NS_ENUM(NSInteger,NIMKitBubbleType){
    NIMKitBubbleTypeChat,
    NIMKitBubbleTypeNotify,
};

@protocol TYHSessionMessageContentViewDelegate <NSObject>

-(void)chartCellLongPress:(TYHSessionMessageContentView *)contentView content:(TYHChartCellFrame *)frameModel indexPath:(NSIndexPath *)index;
-(void)chartCellTapPress:(TYHSessionMessageContentView *)contentView content:(TYHChartCellFrame *)frameModel indexPath:(NSIndexPath *)index;

@end

@interface TYHSessionMessageContentView : UIControl

@property (nonatomic,strong) UIImageView * bubbleImageView;
@property (nonatomic,assign) id<TYHSessionMessageContentViewDelegate> delegate;

@property (nonatomic,assign) NIMKitBubbleType bubbleType;

@property (nonatomic,strong) TYHChartCellFrame *cellFrame;

@property (nonatomic,strong) NSIndexPath *index;
//设置数据
- (void)setupData;
@end
