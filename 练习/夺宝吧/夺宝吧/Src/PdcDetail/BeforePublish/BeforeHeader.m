//
//  BeforeHeader.m
//  夺宝吧
//
//  Created by xiaocai on 15/8/7.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "BeforeHeader.h"

@interface BeforeHeader ()
{
    __weak IBOutlet UILabel *titleLab;
    
}
@end
@implementation BeforeHeader

- (void)awakeFromNib
{
    titleLab.textColor = QBB_RED_COLOR;
}

@end
