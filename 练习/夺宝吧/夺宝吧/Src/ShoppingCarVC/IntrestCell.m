//
//  IntrestCell.m
//  夺宝吧
//
//  Created by xiaocai on 15/6/26.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "IntrestCell.h"

@interface IntrestCell ()
{
    __weak IBOutlet UIImageView *img;
    
    __weak IBOutlet UILabel *nameLab;
}
@end
@implementation IntrestCell

- (void)awakeFromNib {
    // Initialization code
}
//填充cell的方法
- (void)fillCellWithModel:(WYShopCarModel *)model
{
    [img sd_setImageWithURL:[NSURL URLWithString:model.imgPath] placeholderImage:[UIImage imageNamed:@"moren"]];
    nameLab.text = model.name;
}
@end
