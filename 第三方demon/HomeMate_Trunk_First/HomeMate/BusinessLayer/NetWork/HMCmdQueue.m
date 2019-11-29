//
//  HMCmdQueue.m
//  HomeMate
//
//  Created by Air on 15/9/17.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "HMCmdQueue.h"

@implementation HMCmdQueue
-(id)init
{
    self = [super init];
    if (self) {
        
        self.maxConcurrentOperationCount = 1;
        
        self.taskArray = [NSMutableArray array];
        
//        self.cmdTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self
//                                                             selector:@selector(checkTask)
//                                                             userInfo:nil repeats:YES];
    }
    return self;
}

-(void)checkTask
{
//    if (self.taskArray.count) {
//        
//        NSOperation *operation = self.taskArray.lastObject;
//        [self setSuspended:NO];
//        [super addOperation:operation];
//        [self.taskArray removeObject:operation];
//    }
}
- (void)addReqOperation:(NSOperation *)operation
{
    
}
- (void)addOperation:(NSOperation *)operation
{
    [self.lock lock];
    
    if (self.operationCount) {
        [operation addDependency:self.operations.lastObject];
    }
    [super addOperation:operation];
    
    [self.lock unlock];
}

@end
