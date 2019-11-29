//
//  CHTableViewCell.m
//  CAAnimationTest
//
//  Created by JCH on 16/1/9.
//  Copyright © 2016年 JCH. All rights reserved.
//

#import "CHTableViewCell.h"
#import "UIView+CHView.h"

@implementation CHTableViewCell{
    NSInteger number;
}

- (void)awakeFromNib {
    // Initialization code
    self.numberLabel.layer.borderWidth = 1;
    self.numberLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

- (IBAction)plusTapped:(id)sender {
    if (number <= 9999) {
        number++;
        [self updateNumberLabel];
        CGPoint btnPoint = [self convertPoint:self.plusBtn.center toView:self.superview];
        self.plusTapHandle(btnPoint);
    }
    
}

- (IBAction)minusTapped:(id)sender {
    if (number) {
        number--;
        [self updateNumberLabel];
        self.minusTapHandle();
    }
    
}

- (void)updateNumberLabel {
    self.numberLabel.text = [NSString stringWithFormat:@"%zd", number];
}

- (void)updateConstraints {
    [self.plusBtn addCornerRadiusWithcorners:UIRectCornerTopRight | UIRectCornerBottomRight AndRadii:CGSizeMake(5, 5)];
    [self.minusBtn addCornerRadiusWithcorners:UIRectCornerTopLeft | UIRectCornerBottomLeft AndRadii:CGSizeMake(5, 5)];
    [super updateConstraints];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
 
    // Configure the view for the selected state
}

@end
