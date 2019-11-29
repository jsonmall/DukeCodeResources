//
//  HisNumHeader.m
//  夺宝吧
//
//  Created by xiaocai on 15/7/6.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "HisNumHeader.h"

@interface HisNumHeader ()

@property (strong, nonatomic) UILabel *label;

@end
@implementation HisNumHeader
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.label = [[UILabel alloc] init];
        self.label.font = [UIFont systemFontOfSize:14];
        self.label.textColor = [UIColor grayColor];
        [self addSubview:self.label];
    }
    return self;
}

- (void) setLabelText:(NSString *)text
{
    self.label.text = [NSString stringWithFormat:@" %@",text];
    [self.label sizeToFit];
}
@end
