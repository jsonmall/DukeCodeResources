//
//  ZBMessageShareMenuItem.h
//  MessageDisplay
//
//  Created by zhoubin@moshi on 14-5-13.
//  Copyright (c) 2014年 Crius_ZB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZBMessageShareMenuItem : NSObject

@property (nonatomic, strong) UIImage *normalIconImage;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIImage *HighlightIconImage;

// 新增属性（字段）
@property (nonatomic, assign) BOOL isSelected;
@property (nonatomic, copy) NSString *selectedTitle;

- (instancetype)initWithNormalIconImage:(UIImage *)normalIconImage
                                   higt:(UIImage *)HighlightIconImage
                                  title:(NSString *)title;

- (void)shareMenuItemSelected:(BOOL)selected selectedTitle:(NSString *)selectedTitle;

@end
