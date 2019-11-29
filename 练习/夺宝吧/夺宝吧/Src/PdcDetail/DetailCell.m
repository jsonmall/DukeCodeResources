//
//  DetailCell.m
//  夺宝吧
//
//  Created by xiaocai on 15/6/30.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "DetailCell.h"
#import "OtherDuoBaoVC.h"
@interface DetailCell ()
{
    __weak IBOutlet UIImageView *img;
    __weak IBOutlet UILabel *countLab;
    __weak IBOutlet UILabel *numLab;
    __weak IBOutlet UILabel *addressLab;
    
    RecordModel *_currentModel;
}
@end
@implementation DetailCell

- (void)awakeFromNib {
    // Initialization code
    img.layer.masksToBounds = YES;
    img.layer.cornerRadius = img.frame.size.width/2;
    
    UILabel *line_up = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMidX(img.frame), 0, 0.5, img.frame.origin.y)];
    line_up.backgroundColor = [UIColor grayColor];
    [self addSubview:line_up];
    UILabel *line_down = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMidX(img.frame), CGRectGetMaxY(img.frame), 0.5, self.frame.size.height - CGRectGetMaxY(img.frame))];
    line_down.backgroundColor = [UIColor grayColor];
//    NSLog(@"--->x=%f",line_up.frame.origin.x);
    [self addSubview:line_down];
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Dbb_backColor"]];
    //给头像添加点击事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imgOnClick)];
    img.userInteractionEnabled = YES;
    [img addGestureRecognizer:tap];
}
- (void)imgOnClick
{
    OtherDuoBaoVC *otherVC = [[OtherDuoBaoVC alloc]init];
    otherVC.uid = _currentModel.record_uid;
    [[WYMainTabBarVC shareMainTaBarVC].navigationController pushViewController:otherVC animated:YES];
}
//填充cell的方法
- (void)fillCellWithModel:(RecordModel *)model
{
    _currentModel = model;
    [img sd_setImageWithURL:[NSURL URLWithString:model.record_img] placeholderImage:[UIImage imageNamed:@"moren"]];
    countLab.text = model.record_name;
    img.layer.borderWidth = 2;
    img.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    NSString *left = [NSString stringWithFormat:@"%@",@"参与次数: "];
    NSString *mid = [NSString stringWithFormat:@"%@",model.record_totle];
    NSString *right = [NSString stringWithFormat:@"次  %@",model.record_time];
    numLab.attributedText = [WYPublic getRedMiddleStrWithLeft:left Middle:mid RightStr:right Font:11];
    addressLab.text = [NSString stringWithFormat:@"(%@IP:%@)",model.record_address,model.record_ip];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
