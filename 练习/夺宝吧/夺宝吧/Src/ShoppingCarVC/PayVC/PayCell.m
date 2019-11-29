//
//  PayCell.m
//  夺宝吧
//
//  Created by xiaocai on 15/6/29.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "PayCell.h"

@interface PayCell ()
{
    __weak IBOutlet UIImageView *img;
    __weak IBOutlet UILabel *nameLab;
    __weak IBOutlet UILabel *countLab;
    
}
@end
@implementation PayCell

- (void)awakeFromNib {
    // Initialization code
    [self addSubview:[WYPublic getFenGexian:0 :self.frame.size.height - 0.5 :WYMWITH :0.5]];
    countLab.textColor = QBB_RED_COLOR;
}
//填充cell
- (void)fillCellWithModel:(WYShopCarModel *)model
{
    [img sd_setImageWithURL:[NSURL URLWithString:model.imgPath] placeholderImage:[UIImage imageNamed:@"moren"]];
    nameLab.text = [NSString stringWithFormat:@"(第%@期)%@",model.qishu,model.name];
    countLab.text = [NSString stringWithFormat:@"%d夺币",model.count];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
