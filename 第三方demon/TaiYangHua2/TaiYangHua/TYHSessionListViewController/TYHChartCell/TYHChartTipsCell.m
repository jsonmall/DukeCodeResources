//
//  TYHChartTipsCell.m
//  TaiYangHua
//
//  Created by Vieene on 16/1/20.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "TYHChartTipsCell.h"
#import "TYHChartCellFrame.h"
#import "NSString+TextSize.h"
@interface TYHChartTipsCell ()

@property (nonatomic,strong) UIView *containerView;
@property (nonatomic,strong) UILabel *contentLabel;
@end
CGFloat TipsCellcontainerLeft = 40;
CGFloat TipsCellcontaineRight = 40;
CGFloat TipsCellcontainerTop = 5;
CGFloat TipsCellcontainerBottom = 5;

CGFloat TipsCellLabelLeft = 20;
CGFloat TipsCellLabelRight = 10;
CGFloat TipsCellLabelTop = 10;
CGFloat TipsCellLabelBottom = 10;

@implementation TYHChartTipsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = colorf0fGrey;
        
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = colore0eGrey;
        self.containerView = view;
        self.containerView.layer.cornerRadius = 8;
        self.containerView.layer.masksToBounds = YES;
        [self.contentView addSubview:view];
        
        UILabel *label = [[UILabel alloc] init];
        label.font = fontSize24;
        label.textAlignment = NSTextAlignmentLeft;
        label.numberOfLines = 0;
        label.textColor = color646grey;
        [self.containerView addSubview:label];
        self.contentLabel = label;
        
    }
    return self;
}


- (void)setCellFrame:(TYHChartCellFrame *)cellFrame
{
    _cellFrame = cellFrame;
    _contentLabel.text = cellFrame.chartMessage.wds;
//    DDLogDebug(@"cellHeight--%f",cellFrame.cellHeight);
    if (cellFrame.cellHeight >= 50) {
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        
    }else{
        _contentLabel.textAlignment = NSTextAlignmentCenter;

    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    WS(weakself);
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakself).with.insets(UIEdgeInsetsMake(TipsCellcontainerTop, TipsCellcontainerLeft, TipsCellcontainerBottom,TipsCellcontaineRight));
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakself.containerView).with.insets(UIEdgeInsetsMake(TipsCellLabelTop, TipsCellLabelLeft, TipsCellLabelBottom,TipsCellLabelRight));
    }];
}
@end
