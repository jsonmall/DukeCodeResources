//
//  HMPersonInfoCell.m
//  HomeMate
//
//  Created by liuzhicai on 15/12/25.
//  Copyright © 2015年 Air. All rights reserved.
//

#import "HMPersonInfoCell.h"

@implementation HMPersonInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        CGFloat height = 85;
        _iconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _iconBtn.frame = CGRectMake(15, (height-65)/2.0, 129/2.0, 65);
        [_iconBtn setBackgroundImage:[UIImage imageNamed:@"bg_head-portrait_normal"] forState:UIControlStateNormal];
        [_iconBtn setBackgroundImage:[UIImage imageNamed:@"bg_head-portrait_pressed"] forState:UIControlStateHighlighted];
        [self.contentView addSubview:_iconBtn];
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_iconBtn.frame)+15, (height-30)/2.0, ScreenHeight-CGRectGetMaxX(_iconBtn.frame)-15-35, 30)];
        [self.contentView addSubview:_titleLab];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
