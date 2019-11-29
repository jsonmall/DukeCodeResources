//
//  TYHSessionTimestampCell.h
//  NIMDemo
//
//  Created by ght on 15-1-28.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TYHTimestampModel;

@interface TYHSessionTimestampCell : UITableViewCell


@property (strong, nonatomic) UILabel *timeLabel;

- (void)refreshData:(TYHTimestampModel *)data;

@end
