//
//  WaitingForRltCell.m
//  夺宝吧
//
//  Created by xiaocai on 15/8/7.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "WaitingForRltCell.h"

@interface WaitingForRltCell ()
{
    __weak IBOutlet UILabel *titleLab;
    
}
@end
@implementation WaitingForRltCell

- (void)awakeFromNib {
    // Initialization code
    [self addSubview:[WYPublic getFenGexian:0 :0 :WYMWITH :0.5]];
    [self addSubview:[WYPublic getFenGexian:0 :self.frame.size.height-0.5 :WYMWITH :0.5]];
}
//填充cell的方法
- (void)fillCellWithModel:(OwnerModel *)model
{
    titleLab.textColor = QBB_RED_COLOR;
    titleLab.text = [NSString stringWithFormat:@"   第%@期 正在揭晓中……",[WYPublic getUsefullStr:model.owner_qishu]];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
