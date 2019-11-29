//
//  HMTimerListCell.h
//  HomeMate
//
//  Created by liuzhicai on 15/12/7.
//  Copyright © 2015年 Air. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMTimerListCell : UITableViewCell

@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel  *repeatLabel;
//@property (nonatomic, strong) UIButton *switchOpenBtn;
//@property (nonatomic, strong) UIButton *switchCloseBtn;
@property (nonatomic, strong) UISwitch *switchBtn;

-(void)refreshCellWithData:(HMTiming *)timerObj;

@end
