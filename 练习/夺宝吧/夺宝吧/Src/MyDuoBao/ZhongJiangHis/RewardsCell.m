//
//  RewardsCell.m
//  夺宝吧
//
//  Created by xiaocai on 15/7/21.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "RewardsCell.h"
#import "RewardDetailVC.h"
@interface RewardsCell ()
{
    
    __weak IBOutlet UIImageView *img;
    __weak IBOutlet UILabel *titleLab;
    __weak IBOutlet UILabel *numLab;
    __weak IBOutlet UILabel *countLab;
    __weak IBOutlet UILabel *timeLab;
    __weak IBOutlet UILabel *statuslab;
    //查看奖品状态
    __weak IBOutlet UIButton *showBtn;
    RewardModel *_currentModel;
    
    //分割线
    UIView *fenge1;
    UIView *fenge2;
}
@end
@implementation RewardsCell

- (void)awakeFromNib {
    showBtn.hidden = YES;
    // Initialization code
    fenge1 = [WYPublic getFenGexian:10 :CGRectGetMaxY(timeLab.frame)+6 :WYMWITH-20 :0.5];
    fenge2 = [WYPublic getFenGexian:0 :self.frame.size.height-0.5 :WYMWITH :0.5];
    [self addSubview:fenge1];
    [self addSubview:fenge2];
}
- (void)fillCellWithModel:(RewardModel *)model
{
    _currentModel = model;
    if (!self.isMineFlag) {
        showBtn.hidden = YES;
        statuslab.hidden = YES;
        fenge1.hidden = YES;
        self.frame = CGRectMake(0, 0, self.frame.size.width, 110);
        fenge2.frame = CGRectMake(0, self.frame.size.height - 0.5, WYMWITH, 0.5);
    }else{
        showBtn.hidden = NO;
        statuslab.hidden = NO;
    }
    [img sd_setImageWithURL:[NSURL URLWithString:model.reward_imgPath] placeholderImage:[UIImage imageNamed:@"moren"]];
    titleLab.text = [NSString stringWithFormat:@"(第%@期)%@",model.reward_qishu,model.reward_title];
    numLab.text = [NSString stringWithFormat:@"幸运号码:%@",model.reward_code];
    countLab.attributedText = [WYPublic getRedMiddleStrWithLeft:@"参与次数:" Middle:model.reward_go_total RightStr:@"次" Font:14];
    timeLab.text = [NSString stringWithFormat:@"揭晓时间:%@",model.reward_time];
    if ([model.reward_current_status class] != [NSNull class]) {
        statuslab.attributedText = [WYPublic getRedMiddleStrWithLeft:@"奖品状态:" Middle:model.reward_current_status RightStr:@"" Font:14];
    }
    
}

//查看奖品状态
- (IBAction)showBtnOnClick:(id)sender {
    //跳往奖品详情
    RewardDetailVC *detailVC = [[RewardDetailVC alloc]init];
    if (self.isMineFlag) {
        detailVC.isMineFlag = YES;
    }else{
        detailVC.isMineFlag = NO;
    }
    
    detailVC.model = _currentModel;
    [[WYMainTabBarVC shareMainTaBarVC].navigationController pushViewController:detailVC animated:YES];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
