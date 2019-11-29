//
//  HMNetworkQueue.m
//  HomeMate
//
//  Created by Air on 15/9/11.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "HMNetworkQueue.h"
#import "HMNetworkTask.h"

@implementation HMNetworkQueue

- (id)init
{
    self = [super init];
    
    [self setMaxConcurrentOperationCount:4];
    [self setSuspended:YES];
    
    return self;
}

+ (id)queue
{
    return [[self alloc] init];
}

- (void)reset
{
    [self cancelAllOperations];
    // 清理资源
    [self setSuspended:YES];
}


- (void)go
{
    [self setSuspended:NO];
}

- (void)cancelAllOperations
{
    // 清理资源，重置变量
    [super cancelAllOperations];
}

// Only add ASIHTTPRequests to this queue!!
- (void)addOperation:(NSOperation *)operation
{
    if (![operation isKindOfClass:[HMNetworkTask class]]) {
        [NSException raise:@"AttemptToAddInvalidRequest" format:@"Attempted to add an object that was not an ASIHTTPRequest to an ASINetworkQueue"];
    }
    
    _requestsCount += 1;
    
    HMNetworkTask *request = (HMNetworkTask *)operation;
    
    //[request setQueue:self];
    [super addOperation:request];
    
}

- (void)requestFinished:(HMNetworkTask *)request
{
    _requestsCount -= 1;

//    if ([self requestDidFinishSelector]) {
//        [[self delegate] performSelector:[self requestDidFinishSelector] withObject:request];
//    }
//    if ([self requestsCount] == 0) {
//        if ([self queueDidFinishSelector]) {
//            [[self delegate] performSelector:[self queueDidFinishSelector] withObject:self];
//        }
//    }
}

- (void)requestFailed:(HMNetworkTask *)request
{
    _requestsCount -= 1;
//    if ([self requestDidFailSelector]) {
//        [[self delegate] performSelector:[self requestDidFailSelector] withObject:request];
//    }
//    if ([self requestsCount] == 0) {
//        if ([self queueDidFinishSelector]) {
//            [[self delegate] performSelector:[self queueDidFinishSelector] withObject:self];
//        }
//    }
//    if ([self shouldCancelAllRequestsOnFailure] && [self requestsCount] > 0) {
//        [self cancelAllOperations];
//    }
    
}

@end
