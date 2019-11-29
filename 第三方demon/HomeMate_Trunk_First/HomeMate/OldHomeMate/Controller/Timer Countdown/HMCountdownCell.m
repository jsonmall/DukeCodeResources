//
//  HMCountdownCell.m
//  HomeMate
//
//  Created by liuzhicai on 15/12/7.
//  Copyright © 2015年 Air. All rights reserved.
//

#import "HMCountdownCell.h"

@implementation HMCountdownCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        CGFloat cellHeight = 60;
         _switchBtn = [[UISwitch alloc] initWithFrame:CGRectMake(ScreenWidth-15*HProportion-65, (cellHeight-33.5)/2.0, 65, 33.5)];
        
        [self.contentView addSubview:_switchBtn];
        
        _countdownLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, (cellHeight-25)/2.0, ScreenWidth-80-15-10, 25)];
        _countdownLabel.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:_countdownLabel];
        
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)refreshCountdownCellWithData:(HMCountdownModel *)countdownObj {
    
    NSMutableString *textStr = [NSMutableString string];
    
    int currentSecs = [[NSDate date] timeIntervalSince1970];        // 当前秒数
    int executeSecs = countdownObj.time * 60 + countdownObj.startTime;  // 倒计时执行秒数
    int remainSecs = executeSecs - currentSecs;   // 剩余秒数
    
    if (countdownObj.isPause == 0 || remainSecs <= 0) {    // 倒计时失效或时间已过，置为初始值
        remainSecs = countdownObj.time * 60;
    }
    [textStr appendString:[self formateStrWithSecs:remainSecs]];
    
    NSString *sufStr = nil;
    if (countdownObj.value1 == 0) {
        sufStr = NSLocalizedString(@"Localizeble_OpenLater", nil);
    }else if (countdownObj.value1 == 1) {
        sufStr = NSLocalizedString(@"Localizeble_CloseLater", nil);
    }
    [textStr appendString:sufStr];
    
    
    _countdownLabel.text = textStr;
    self.initialStr = [NSString stringWithFormat:@"%@%@",[self formateStrWithSecs:countdownObj.time*60],sufStr];
    self.secondPartStr = sufStr;
    if (countdownObj.isPause == 1) {
        [self.switchBtn setOn:YES];
        self.contentView.alpha = 1;
    }else if (countdownObj.isPause == 0) {
        [self.switchBtn setOn:NO];
        self.contentView.alpha = 0.5;
    }
    
    remainSecs = executeSecs - currentSecs;
    if (remainSecs <= 0) {
        [self.switchBtn setOn:NO];
        self.contentView.alpha = 0.5;
    }
}

- (NSString *)formateStrWithSecs:(int)remainSecs {
    
    int hour = remainSecs / 3600;
    int min = (remainSecs - hour*3600)/60;
    int sec = remainSecs - hour*3600 - min*60;
    
    return  [NSString stringWithFormat:@"%02d:%02d:%02d",hour,min,sec];
}



@end
