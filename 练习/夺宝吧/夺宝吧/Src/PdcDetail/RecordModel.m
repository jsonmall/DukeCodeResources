//
//  RecordModel.m
//  夺宝吧
//
//  Created by xiaocai on 15/6/30.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "RecordModel.h"

@implementation RecordModel

- (instancetype)init
{
    if (self = [super init]) {
        self.record_records = [NSMutableArray array];
    }
    return self;
}
@end
