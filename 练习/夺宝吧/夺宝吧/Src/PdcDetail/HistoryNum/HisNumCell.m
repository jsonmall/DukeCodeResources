//
//  HisNumCell.m
//  夺宝吧
//
//  Created by xiaocai on 15/7/6.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "HisNumCell.h"

@interface HisNumCell ()
{
    __weak IBOutlet UILabel *lab;
    
}
@end
@implementation HisNumCell

- (void)fillCellWithModel:(HisNumModel *)model
{
    lab.text = [NSString stringWithFormat:@" %@",model.rownum];
    if (model.numFlag) {
        lab.textColor = QBB_RED_COLOR;
    }else{
        lab.textColor = [UIColor grayColor];
    }
}
- (void)fillCellWithTitle:(NSString*)title isRedColor:(BOOL)isRed
{
     lab.text = title;
    if (isRed){
        lab.textColor = [UIColor redColor];
    }else{
        lab.textColor = [UIColor grayColor];
    }
}
- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}

@end
