//
//  TYHDataSource.m
//  TaiYangHua
//
//  Created by Vieene on 16/1/16.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "TYHDataSource.h"
#import "TYHChartCellFrame.h"
#import "TYHTimestampModel.h"
@interface TYHDataSource()

@property (nonatomic, strong) NSMutableArray  *cellFrames;


@property (nonatomic,assign) NSTimeInterval firstTimeInterval;

@property (nonatomic,assign) NSTimeInterval lastTimeInterval;
@end

@implementation TYHDataSource
- (instancetype)initWithShowTimeInterval:(NSTimeInterval)timeInterval
{
    if (self = [self init]) {
        _showTimeInterval  = timeInterval;
        _firstTimeInterval = 0;
        _lastTimeInterval  = 0;
        _cellFrames = [[NSMutableArray alloc] init];
    }
    return self;
}


- (void)addMessages:(NSArray*)messages
{
    [self appendMessages:messages];
}
- (void)deleteLastModel
{
    [self.cellFrames removeLastObject];
}


- (void )appendMessages:(NSArray *)messages{
    if (!messages.count) {
        return ;
    }
//    NSInteger count = self.cellFrames.count;
    for (TYHChartCellFrame *message in messages) {
        [self appendMessage:message];
    }
//    NSMutableArray *append = [[NSMutableArray alloc] init];
//    for (NSInteger i = count; i < self.cellFrames.count; i++) {
//        [append addObject:@(i)];
//    }
}


- (void)appendMessage:(TYHChartCellFrame *)message{
    TYHTimestampModel *timeModel = nil;

    if ([message.chartMessage.tm doubleValue]- self.lastTimeInterval > self.showTimeInterval) {
        timeModel = [[TYHTimestampModel alloc] init];
        timeModel.messageTime = [message.chartMessage.tm doubleValue];
        [self.cellFrames addObject:timeModel];
    }
    [self.cellFrames addObject:message];
    self.lastTimeInterval = [message.chartMessage.tm doubleValue];
    
//    DLog(@"当前数据源的总个数为：%lu",(unsigned long)self.cellFrames.count);
//    [self.msgIdDict setObject:model forKey:model.message.messageId];
}
- (void)removeAllmsg{
    [self.cellFrames removeAllObjects];
}
- (NSInteger)numberOfsource
{
    return self.cellFrames.count;
}
- (id)getModelWithRow:(NSInteger )row
{
    return   [self.cellFrames objectAtIndex:row];
}
@end
