//
//  TestCostomTableViewCell.m
//  XMProfileController
//
//  Created by sfk-ios on 2018/6/13.
//  Copyright © 2018年 aiq西米. All rights reserved.
//

#import "TestCostomTableViewCell.h"

@interface TestCostomTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *titleL;

@end

@implementation TestCostomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    
    _titleL.text = title;
}

/// 按钮点击
- (IBAction)btnClick:(id)sender {
    NSLog(@"按钮点击");
    int R = (arc4random() % 256) ;
    int G = (arc4random() % 256) ;
    int B = (arc4random() % 256) ;
    [sender setBackgroundColor:[UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
