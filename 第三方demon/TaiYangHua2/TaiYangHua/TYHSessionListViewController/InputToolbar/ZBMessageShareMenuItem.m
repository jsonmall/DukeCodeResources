//
//  ZBMessageShareMenuItem.m
//  MessageDisplay
//
//  Created by zhoubin@moshi on 14-5-13.
//  Copyright (c) 2014年 Crius_ZB. All rights reserved.
//

#import "ZBMessageShareMenuItem.h"


@implementation ZBMessageShareMenuItem

- (instancetype)initWithNormalIconImage:(UIImage *)normalIconImage higt:(UIImage *)HighlightIconImage title:(NSString *)title{
    
    if (self) {
        self.normalIconImage = normalIconImage;
        self.title = title;
        
        // 默认为未选择状态，选中默认为正常的title
        self.selectedTitle = title;
        self.isSelected = NO;
    }
    return self;
}

- (void)shareMenuItemSelected:(BOOL)selected selectedTitle:(NSString *)selectedTitle
{
    self.isSelected = selected;
    self.selectedTitle = selectedTitle;
}

- (void)dealloc{
    self.normalIconImage = nil;
    self.title = nil;
}



@end
