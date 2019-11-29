//
//  HMCountdownCell.h
//  HomeMate
//
//  Created by liuzhicai on 15/12/7.
//  Copyright © 2015年 Air. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMCountdownCell : UITableViewCell

@property (nonatomic, strong) UILabel *countdownLabel;
@property (nonatomic, strong) UISwitch *switchBtn;

@property (nonatomic, strong)NSTimer *timer;

/**
 *  后半部分字符串： 如 “后关闭” 或者 “后开启”
 */
@property (nonatomic, copy)NSString *secondPartStr;

@property (nonatomic, copy)NSString *initialStr; // 初始字符串，即倒计时刚设定时显示的字符串

-(void)refreshCountdownCellWithData:(HMCountdownModel *)countdownObj;

@end
