//
//  RewardsDetailHeader.m
//  夺宝吧
//
//  Created by xiaocai on 15/7/21.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "RewardsDetailHeader.h"

@interface RewardsDetailHeader ()
{
    __weak IBOutlet UIImageView *img;
    __weak IBOutlet UILabel *titleLab;
    __weak IBOutlet UILabel *numLab;
    __weak IBOutlet UILabel *countLab;
    __weak IBOutlet UILabel *timeLab;
}
@end
@implementation RewardsDetailHeader

- (void)awakeFromNib
{
    [self addSubview:[WYPublic getFenGexian:0 :self.frame.size.height-0.5 :WYMWITH :0.5]];
}
- (void)setModel:(RewardModel *)model
{
    _model = model;
    [img sd_setImageWithURL:[NSURL URLWithString:model.reward_imgPath] placeholderImage:[UIImage imageNamed:@"moren"]];
    titleLab.text = [NSString stringWithFormat:@"(第%@期)%@",model.reward_qishu,model.reward_title];
    numLab.text = [NSString stringWithFormat:@"幸运号码:%@",model.reward_code];
    countLab.attributedText = [WYPublic getRedMiddleStrWithLeft:@"参与次数:" Middle:model.reward_go_total RightStr:@"次" Font:14];
    timeLab.text = [NSString stringWithFormat:@"揭晓时间:%@",model.reward_time];
}
@end
