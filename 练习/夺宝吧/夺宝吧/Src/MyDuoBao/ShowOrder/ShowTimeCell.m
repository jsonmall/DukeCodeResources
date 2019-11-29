//
//  ShowTimeCell.m
//  夺宝吧
//
//  Created by xiaocai on 15/7/28.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "ShowTimeCell.h"

@interface ShowTimeCell ()
{
    __weak IBOutlet UIImageView *img;
    __weak IBOutlet UILabel *titleLab;
    __weak IBOutlet UILabel *countLab;
    __weak IBOutlet UILabel *timeLab;
    __weak IBOutlet UILabel *dscLab;
    
    __weak IBOutlet UIImageView *img1;
    __weak IBOutlet UIImageView *img2;
    __weak IBOutlet UIImageView *img3;
    
    __weak IBOutlet UILabel *daishenheLab;
    
}
@end
@implementation ShowTimeCell

- (void)awakeFromNib {
    // Initialization code
    //分割线
    [self addSubview:[WYPublic getFenGexian:0 :self.frame.size.height - 0.5 :WYMWITH :0.5]];
    img.layer.borderWidth = 2;
    img.layer.borderColor = [UIColor lightGrayColor].CGColor;
    img.layer.cornerRadius = img.frame.size.width/2;
    img.layer.masksToBounds = YES;
    countLab.textColor = QBB_RED_COLOR;
    daishenheLab.layer.masksToBounds = YES;
    daishenheLab.layer.cornerRadius = 2;
    daishenheLab.layer.borderWidth = 1;
    daishenheLab.layer.borderColor = QBB_RED_COLOR.CGColor;
    daishenheLab.textColor = QBB_RED_COLOR;
    daishenheLab.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    
}
- (void)fillCellWithModel:(ShowOrderModel *)model
{
    [img sd_setImageWithURL:[NSURL URLWithString:[WYPublic getUsefullStr:model.sd_user_img]] placeholderImage:[UIImage imageNamed:@"moren"]];
    if(self.isDetailFlag){
        titleLab.attributedText = [WYPublic getRedMiddleStrWithLeft:@"" Middle:[WYPublic getUsefullStr:model.sd_title] RightStr:@"" Font:13];
        countLab.text = [WYPublic getUsefullStr:model.sd_username];
        countLab.textColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"db_blu_color"]];
    }else{
        titleLab.text = [NSString stringWithFormat:@"(第%@期)%@",[WYPublic getUsefullStr:model.sd_pdc_qishu],[WYPublic getUsefullStr:model.sd_pdc_title]];
        countLab.textColor = QBB_RED_COLOR;
        countLab.text = [WYPublic getUsefullStr:model.sd_title];
    }
    //待审核lable的处理
    if ([[WYPublic getUsefullStr:model.sd_is_passed] isEqualToString:@"0"]) {
        daishenheLab.hidden = NO;
        titleLab.frame = CGRectMake(CGRectGetMaxX(daishenheLab.frame), titleLab.frame.origin.y, 212*AUTOX, titleLab.frame.size.height);
    }else{
        daishenheLab.hidden = YES;
        titleLab.frame = CGRectMake(CGRectGetMinX(countLab.frame), titleLab.frame.origin.y, 258*AUTOX, titleLab.frame.size.height);
    }
    timeLab.text = [WYPublic getUsefullStr:model.sd_time];
    dscLab.text = [WYPublic getUsefullStr:model.sd_content];
    img1.image = nil;
    img2.image = nil;
    img3.image = nil;
    if ([model.sd_imgs class] != [NSNull class]) {
        if(model.sd_imgs.count > 0){
            [img1 sd_setImageWithURL:[NSURL URLWithString:model.sd_imgs[0]] placeholderImage:[UIImage imageNamed:@"moren"]];
        }
        if(model.sd_imgs.count > 1){
            [img2 sd_setImageWithURL:[NSURL URLWithString:model.sd_imgs[1]] placeholderImage:[UIImage imageNamed:@"moren"]];
        }
        if(model.sd_imgs.count > 2){
            [img3 sd_setImageWithURL:[NSURL URLWithString:model.sd_imgs[2]] placeholderImage:[UIImage imageNamed:@"moren"]];
        }
    }
}

@end
