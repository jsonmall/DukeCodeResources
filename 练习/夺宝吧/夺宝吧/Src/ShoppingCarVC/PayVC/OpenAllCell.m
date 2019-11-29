//
//  OpenAllCell.m
//  夺宝吧
//
//  Created by xiaocai on 15/6/29.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "OpenAllCell.h"

@interface OpenAllCell ()
{
    __weak IBOutlet UIImageView *img;
}
@end
@implementation OpenAllCell

- (void)awakeFromNib {
    // Initialization code
    [self addSubview:[WYPublic getFenGexian:0 :self.frame.size.height-0.5 :WYMWITH :0.5]];
}
//改变标记图片
- (void)changePicWithOpenFlag:(BOOL)flag
{
    if (flag) {
        img.image = [UIImage imageNamed:@"icon_up"];
    }else{
        img.image = [UIImage imageNamed:@"icon_down"];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
