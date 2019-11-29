//
//  LockCell.m
//  夺宝吧
//
//  Created by xiaocai on 15/7/20.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "LockCell.h"

@interface LockCell ()
{
    __weak IBOutlet UILabel *timeLab;
    __weak IBOutlet UILabel *codeLab;
    __weak IBOutlet UILabel *countLab;
}
@end
@implementation LockCell

- (void)awakeFromNib {
    // Initialization code
    [self addSubview:[WYPublic getFenGexian:0 :self.frame.size.height-0.5 :self.frame.size.width*AUTOX :0.5]];
}
- (void)fillCellWithModel:(LockModel *)model
{
    timeLab.text = model.lock_time;
    codeLab.text = [NSString stringWithFormat:@"订单编号:%@",model.lock_code];
    countLab.attributedText = [WYPublic getRedMiddleStrWithLeft:@"参与次数:" Middle:[NSString stringWithFormat:@"%@次",model.lock_gonum] RightStr:@"" Font:14];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
