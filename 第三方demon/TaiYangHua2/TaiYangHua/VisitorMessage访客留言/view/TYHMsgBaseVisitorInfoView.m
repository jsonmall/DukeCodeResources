//
//  TYHMsgBaseVisitorInfo.m
//  TaiYangHua
//
//  Created by HHLY on 15/12/25.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import "TYHMsgBaseVisitorInfoView.h"
#import "TYHVisitorLeaveMsgInfo.h"

@interface TYHMsgBaseVisitorInfoView ()

@property (weak, nonatomic) IBOutlet UILabel *msgStateLabel;
@property (weak, nonatomic) IBOutlet UILabel *msgTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *visitorNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *visitorAreaLabel;
@property (weak, nonatomic) IBOutlet UILabel *telephoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;

@end

@implementation TYHMsgBaseVisitorInfoView

- (void)awakeFromNib
{
    NSLog(@"awake from nib.....");
}

- (void)setMsgInfo:(TYHVisitorLeaveMsgInfo *)msgInfo
{
    self.msgStateLabel.text = msgInfo.handleState ? @"已处理" : @"未处理";
    self.msgTimeLabel.text = msgInfo.createTime;
    self.visitorNameLabel.text = msgInfo.visitorName;
    self.visitorAreaLabel.text = msgInfo.visitorAddress;
    self.telephoneLabel.text = msgInfo.visitorTelephone;
    self.emailLabel.text = msgInfo.visitorEmail;
    self.phoneLabel.text = msgInfo.visitorPhone;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
