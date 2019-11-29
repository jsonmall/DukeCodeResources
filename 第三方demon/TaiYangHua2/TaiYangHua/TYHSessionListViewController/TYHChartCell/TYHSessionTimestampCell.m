//
//  TYHSessionTimestampCell.m
//  NIMDemo
//
//  Created by ght on 15-1-28.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "TYHSessionTimestampCell.h"
#import "UIView+NIM.h"
#import "TYHTimestampModel.h"
#import "TYHKitUtil.h"
#import "UIImage+NIM.h"

@interface TYHSessionTimestampCell()

@property (nonatomic,strong) TYHTimestampModel *model;

@end

@implementation TYHSessionTimestampCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        _timeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _timeLabel.font = [UIFont boldSystemFontOfSize:12.f];
        _timeLabel.textColor = colorc8cwhiteGrey;
        [self addSubview:_timeLabel];
        self.backgroundColor = colorf0fGrey;

    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [_timeLabel sizeToFit];
    _timeLabel.center = CGPointMake(self.nim_centerX, 20);
  
}


- (void)refreshData:(TYHTimestampModel *)data{
    self.model = data;
    if([self checkData]){
        TYHTimestampModel *model = (TYHTimestampModel *)data;
        [_timeLabel setText:[TYHKitUtil showTime:model.messageTime showDetail:YES]];
    }
}

- (BOOL)checkData{
    return [self.model isKindOfClass:[TYHTimestampModel class]];
}

@end
