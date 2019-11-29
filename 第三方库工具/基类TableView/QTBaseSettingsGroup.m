//
//  QTBaseSettingsGroup.m
//  QTime
//
//  Created by Jren on 16/1/8.
//  Copyright © 2016年 Mark. All rights reserved.
//

#import "QTBaseSettingsGroup.h"

@implementation QTBaseSettingsGroup

+ (instancetype)group
{
    return [[self alloc] init];
}

- (NSMutableArray<QTBaseSettingsItem *> *)items
{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

@end
