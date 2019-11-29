//
//  BLCountdownTimer.m
//  CloudPlatform
//
//  Created by orvibo on 15/5/26.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "BLCountdownTimer.h"
#import "MSWeakTimer.h"

@interface BLCountdownTimer()



@end

static const char *MSSampleViewControllerTimerQueueContext = "MSSampleViewControllerTimerQueueContext";

@implementation BLCountdownTimer
{
    MSWeakTimer         *_weakTimer;//target是弱引用，没有runloop概念【NSTimer target是retain,invalidate必须由安装这个timer的线程发起，否则这个timer有可能不会从run loop中移除。这种情况会发生的一个情况就是： 当这个线程是由 GCD 管理的。 这是因为 NSTimer 依赖于当前线程的run loop, 而GCD完全是另外一回事， 它不能确保timer的阻塞和invalidate是由同一个线程发起的， run loop和queue将会交织在一起】
    int                  _second;
    NSMutableArray      *_idArr;
    dispatch_queue_t     _privateQueue;
    NSString            *_action;
}

+(instancetype)SharedCountdownTimer
{
    static BLCountdownTimer *countdownTimer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        countdownTimer = [[BLCountdownTimer alloc] init];
    });
    return countdownTimer;
}

-(void)idArrAddObject:(id)object
{
    if (!_idArr) {
        _idArr = [[NSMutableArray alloc] init];
    }
    if (![_idArr containsObject:object]) {
        [_idArr addObject:object];
    }
}
-(void)idArrRemoveObject:(id)object
{
    if ([_idArr containsObject:object]) {
        [_idArr removeObject:object];
    }
}
-(void)idArrRemoveAllObject
{
    [_idArr removeAllObjects];
}
-(void)startTimerWithSecond:(int)second action:(NSString *)action
{
    if (_weakTimer) {
        [self stopTimer];
    }
    _action = [NSString stringWithString:action];
    if (!_privateQueue) {
        _privateQueue = dispatch_queue_create("com.mindsnacks.private_queue", DISPATCH_QUEUE_CONCURRENT);
        dispatch_queue_set_specific(_privateQueue, (__bridge const void *)(self), (void *)MSSampleViewControllerTimerQueueContext, NULL);
    }
    _second = second;
    _weakTimer = [MSWeakTimer scheduledTimerWithTimeInterval:1
                                                      target:self
                                                    selector:@selector(refreshUIWithSecond:)
                                                    userInfo:nil
                                                     repeats:YES
                                               dispatchQueue:_privateQueue];
}
-(int)getCountdownSecond
{
    int second = _second;
    
    return second;
}
-(NSString *)getCountdownEvent
{
    NSString *event = _action;
    return event;
}
-(void)refreshUIWithSecond:(int)second
{
    _second--;
    dispatch_async(dispatch_get_main_queue(), ^{
        for (id obj in _idArr) {
            if ([obj respondsToSelector:@selector(secondHasChanged:action:)]) {
                [obj secondHasChanged:_second action:_action];
            }
        }
    });
    if (_second <= 0) {
        [_weakTimer invalidate];
        self.isExistCountdown = NO;
        self.uid = nil;
        DLog(@"停止倒计时 %@",[NSThread currentThread]);
    }
}

-(void)secondHasChanged:(int)second action:(NSString *)action{}

-(void)stopTimer
{
    [_weakTimer invalidate];
}

@end
