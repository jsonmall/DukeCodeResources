//
//  ImgCell.m
//  夺宝吧
//
//  Created by xiaocai on 15/8/3.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "ImgCell.h"

@interface ImgCell ()
{
    UIImageView *imv;
}

@end
@implementation ImgCell

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initLayuot];
    }
    return self;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initLayuot];
    }
    return self;
}
//初始化控件
-(void)initLayuot{
    UIView *iv = [self viewWithTag:111];
    [iv removeFromSuperview];
    
    imv = [[UIImageView alloc]initWithFrame:CGRectMake(8, 0, self.frame.size.width-16, self.frame.size.height-8)];
    imv.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:imv];
}
//填充cell的方法
- (void)fillCellWithImage:(UIImage *)img
{
    [self initLayuot];
    imv.image = img;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
