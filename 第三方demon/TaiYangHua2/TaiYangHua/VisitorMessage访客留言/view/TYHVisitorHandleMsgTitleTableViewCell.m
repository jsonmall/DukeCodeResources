//
//  TYHVisitorHandleMsgTitleTableViewCell.m
//  TaiYangHua
//
//  Created by HHLY on 15/12/24.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import "TYHVisitorHandleMsgTitleTableViewCell.h"

@implementation TYHVisitorHandleMsgTitleTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setHandleMsgTitleColor:(UIColor *)color
{
    [self.titleLabel1 setTextColor:color];
    [self.titleLabel2 setTextColor:color];
    [self.titleLabel3 setTextColor:color];
    [self.titleLabel4 setTextColor:color];
}

@end
