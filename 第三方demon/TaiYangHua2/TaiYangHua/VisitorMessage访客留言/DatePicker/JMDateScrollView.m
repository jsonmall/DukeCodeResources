//
//  JMDateScrollView.m
//  TestProductForTableView
//
//  Created by HHLY on 15/12/29.
//  Copyright © 2015年 HHLY. All rights reserved.
//

#import "JMDateScrollView.h"

#define VALUES_H 44.0f

NSString *FONT_NAME = @"HelveticaNeue";
@implementation JMDateScrollView

-(instancetype)initWithFrame:(CGRect)frame
                   andValues:(NSArray *)arrayValues
               withTextAlign:(NSTextAlignment)align
                 andTextSize:(CGFloat)txtSize
{
    self = [super initWithFrame:frame];
    if (self) {
        self.textAlignment = align;
        
        self.showsVerticalScrollIndicator = NO;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.backgroundColor = [UIColor clearColor];
        [self setContentInset:UIEdgeInsetsMake(VALUES_H, 0.0, VALUES_H, 0.0)];
        
        self.cellFont = [UIFont fontWithName:FONT_NAME size:txtSize];
        
        if (arrayValues) {
            self.arrValues = [arrayValues copy];
        }
    }
    return self;
}

- (void)dehighlightLastCell
{
    NSArray *paths = [NSArray arrayWithObjects:[NSIndexPath indexPathForRow:self.seletedIndexRow inSection:0], nil];
    [self setSeletedIndexRow:-1];
    [self beginUpdates];
    [self reloadRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationNone];
    [self endUpdates];
}

- (void)highlightCellWithIndexPathRow:(NSUInteger)indexPathRow
{
    [self setSeletedIndexRow:indexPathRow];
    NSArray *paths = [NSArray arrayWithObjects:[NSIndexPath indexPathForRow:self.seletedIndexRow inSection:0], nil];
    [self beginUpdates];
    [self reloadRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationNone];
    [self endUpdates];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
