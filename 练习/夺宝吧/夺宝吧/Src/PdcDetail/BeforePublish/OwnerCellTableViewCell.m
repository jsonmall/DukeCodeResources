//
//  OwnerCellTableViewCell.m
//  夺宝吧
//
//  Created by xiaocai on 15/7/2.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "OwnerCellTableViewCell.h"
#import "OtherDuoBaoVC.h"
@interface OwnerCellTableViewCell ()
{
    __weak IBOutlet UILabel *qishuLab;
    __weak IBOutlet UILabel *nameLab;
    __weak IBOutlet UILabel *addressLab;
    __weak IBOutlet UILabel *numLab;
    __weak IBOutlet UILabel *countLab;
    __weak IBOutlet UIImageView *img;
    OwnerModel *_currentModel;
}
@end
@implementation OwnerCellTableViewCell

- (void)awakeFromNib {
    img.layer.masksToBounds = YES;
    img.layer.cornerRadius = img.frame.size.width/2;
    [self addSubview:[WYPublic getFenGexian:0 :self.frame.size.height-0.5 :WYMWITH :0.5]];
    [self addSubview:[WYPublic getFenGexian:0 :10 :WYMWITH :0.5]];
    [self addSubview:[WYPublic getFenGexian:0 :43 :WYMWITH :0.5]];
    img.layer.borderWidth = 2;
    img.layer.borderColor = [UIColor lightGrayColor].CGColor;
    //给头像添加点击事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imgOnClick)];
    img.userInteractionEnabled = YES;
    [img addGestureRecognizer:tap];
}
- (void)imgOnClick
{
    OtherDuoBaoVC *otherVC = [[OtherDuoBaoVC alloc]init];
    if ([_currentModel.owner_uid class] != [NSNull class]) {
        otherVC.uid = _currentModel.owner_uid;
        [[WYMainTabBarVC shareMainTaBarVC].navigationController pushViewController:otherVC animated:YES];
    }
}
//填充cell的方法
- (void)fillCellWithModel:(OwnerModel *)model
{
    _currentModel = model;
    qishuLab.text = [NSString stringWithFormat:@"   第%@期 揭晓时间:%@",[WYPublic getUsefullStr:model.owner_qishu],[WYPublic getUsefullStr:model.owner_time]];
    nameLab.text = [WYPublic getUsefullStr:model.owner_name];
    addressLab.text = [WYPublic getUsefullStr:model.owner_address];
    numLab.text = [WYPublic getUsefullStr:model.owner_num];
    countLab.attributedText = [WYPublic getRedMiddleStrWithLeft:@"" Middle:[WYPublic getUsefullStr:model.owner_totle] RightStr:@"次" Font:12];
    [img sd_setImageWithURL:[NSURL URLWithString:model.owner_img_header] placeholderImage:[UIImage imageNamed:@"moren"]];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
