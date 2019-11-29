//
//  GlobalSocket.m
//  HomeMate
//
//  Created by Air on 15/8/14.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "GlobalSocket.h"

@interface GlobalSocket ()

/**
 *  时间戳，每次接收到数据之后更新这个值，如果当前时间距离最后一次接收数据的时间超过 maxLiveTime ，那么控制命令超时的时候就应该断开重连了
 */
@property(nonatomic,assign) NSTimeInterval timeStamp;

/**
 *  socket没有接收到数据时，认为其仍然存活的最大时间
 */
@property(nonatomic,assign) NSTimeInterval maxLiveTime;


@end

@implementation GlobalSocket

- (id)init
{
    self = [super init];
    if (self) {
        [self dataInit];
    }
    return self;
}

- (id)initWithSocketQueue:(dispatch_queue_t)sq
{
    self = [super initWithDelegate:nil delegateQueue:NULL socketQueue:sq];
    if (self) {
        [self dataInit];
    }
    return self;
}

- (id)initWithDelegate:(id)aDelegate delegateQueue:(dispatch_queue_t)dq
{
    self = [self initWithDelegate:aDelegate delegateQueue:dq socketQueue:NULL];
    if (self) {
        [self dataInit];
    }
    return self;
}

- (id)initWithDelegate:(id)aDelegate delegateQueue:(dispatch_queue_t)dq socketQueue:(dispatch_queue_t)sq
{
    self = [super initWithDelegate:aDelegate delegateQueue:dq socketQueue:sq];
    if (self) {
        [self dataInit];
    }
    return self;
}


-(void)dataInit
{
    // 初始化
    self.timeStamp = 0;
    self.maxLiveTime = 10;
}

#pragma 确认socket连接成功

- (void)didConnect:(int)aStateIndex
{
    [super didConnect:aStateIndex];
    
    self.updateTimeStamp = YES;
}

#pragma 确认socket关闭成功
- (void)closeWithError:(NSError *)error
{
    [super closeWithError:error];
    self.updateTimeStamp = NO;
}

#pragma mark - 更新时间戳
-(void)setUpdateTimeStamp:(BOOL)updateTimeStamp
{
    if (updateTimeStamp) {
        self.timeStamp = CACurrentMediaTime();
    }else{
        self.timeStamp = 0;
    }
}

#pragma mark - 判定时间戳是否过期
-(BOOL)timeStampExpired
{
    NSTimeInterval now = CACurrentMediaTime();
    NSTimeInterval last = self.timeStamp;
    NSTimeInterval interval = now - last;
    
    BOOL isExpired = (interval > self.maxLiveTime);
    return isExpired;
}

#pragma
-(void)semaphore_create{
#if 0
    dispatch_semaphore_t networkSemaphore = dispatch_semaphore_create(1);
    // wait操作 信号量 -1
    dispatch_semaphore_wait(networkSemaphore, DISPATCH_TIME_FOREVER);
    
    // signal操作 信号量 +1
    dispatch_semaphore_signal(networkSemaphore);
    
    //dispatch_release(networkSemaphore);
#endif
}
-(void)semaphore_wait
{
    dispatch_semaphore_t networkSemaphore;
    // wait操作 信号量 -1
    dispatch_semaphore_wait(networkSemaphore, DISPATCH_TIME_FOREVER);

}

-(void)semaphore_signal
{
    dispatch_semaphore_t networkSemaphore;

    dispatch_semaphore_signal(networkSemaphore);
}

@end
