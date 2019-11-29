//
//  HMCmdQueue.h
//  HomeMate
//
//  Created by Air on 15/9/17.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMCmdQueue : NSOperationQueue

@property (nonatomic, strong) NSMutableArray *taskArray;
// 心跳包 每个网关维持一个心跳包
@property (nonatomic,strong) NSTimer *cmdTimer;

@property (nonatomic,strong) NSLock *lock;

- (void)addReqOperation:(NSOperation *)operation;

@end
