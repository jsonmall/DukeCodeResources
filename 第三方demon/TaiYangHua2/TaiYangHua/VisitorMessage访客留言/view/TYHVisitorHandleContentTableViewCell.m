//
//  TYHVisitorHandleContentTableViewCell.m
//  TaiYangHua
//
//  Created by HHLY on 15/12/24.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import "TYHVisitorHandleContentTableViewCell.h"
#import "TYHVisitorLeaveMsgInfo.h"

@interface TYHVisitorHandleContentTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *msgIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *themeLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;

@end

@implementation TYHVisitorHandleContentTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark -- init value
- (void)setMsgInfo:(TYHVisitorLeaveMsgInfo *)msgInfo
{
    // 给对应的label进行赋值
    self.msgIdLabel.text = [NSString stringWithFormat:@"%03li",(long)msgInfo.msgNumber + 1];
    self.nameLabel.text = msgInfo.visitorName;
    self.themeLabel.text = msgInfo.topicName;
    
    // 注：处理时间只有处理成功的留言有
    NSString *timeString = msgInfo.handleTime?:msgInfo.createTime;
    self.dayLabel.text = [timeString substringWithRange:NSMakeRange(0, 10)];
    //
    self.timeLabel.text = [timeString substringWithRange:NSMakeRange(10, msgInfo.createTime.length - 13)];
}

@end
