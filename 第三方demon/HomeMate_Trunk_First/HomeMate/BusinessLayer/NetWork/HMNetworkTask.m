//
//  HMTask.m
//  HomeMate
//
//  Created by Air on 15/9/11.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "HMNetworkTask.h"

// The default number of seconds to use for a timeout
//static NSTimeInterval defaultTimeOutSeconds = 10;

static NSString *HMSocketRunLoopMode = @"ASIHTTPRequestRunLoopMode";
// The thread all requests will run on
// Hangs around forever, but will be blocked unless there are requests underway
static NSThread *networkThread = nil;

static NSOperationQueue *sharedQueue = nil;


@interface HMNetworkTask ()

@property (assign, nonatomic) BOOL complete;
@property (assign, nonatomic) BOOL inProgress;
@property (assign, nonatomic) int retryCount;
@property (assign, nonatomic) NSString *runLoopMode;
@property (retain, nonatomic) NSTimer *statusTimer;
@property (assign, nonatomic, setter=setSynchronous:) BOOL isSynchronous;

- (void)startRequest;
- (void)updateStatus:(NSTimer *)timer;
- (void)checkRequestStatus;
- (void)reportFailure;
- (void)reportFinished;
- (void)markAsFinished;
- (BOOL)shouldTimeOut;


@end
@implementation HMNetworkTask

- (id)initWithURL:(NSURL *)newURL
{
    self = [self init];

#if 0
    [self setRunLoopMode:NSDefaultRunLoopMode];

    [self setTimeOutSeconds:[ASIHTTPRequest defaultTimeOutSeconds]];
    [self setDidStartSelector:@selector(requestStarted:)];
    [self setDidFinishSelector:@selector(requestFinished:)];
    [self setDidFailSelector:@selector(requestFailed:)];
    [self setCancelledLock:[[[NSRecursiveLock alloc] init] autorelease]];
    [self setDownloadCache:[[self class] defaultCache]];
#endif
    return self;
}


// Run a request synchronously, and return control when the request completes or fails
- (void)startSynchronous
{
    [self setSynchronous:YES];
    [self setRunLoopMode:HMSocketRunLoopMode];
    [self setInProgress:YES];
    
    if (![self isCancelled] && ![self complete]) {
        [self main];
        while (!_complete) {
            [[NSRunLoop currentRunLoop] runMode:[self runLoopMode] beforeDate:[NSDate distantFuture]];
        }
    }
    
    [self setInProgress:NO];
}

// Run request in the background
- (void)startAsynchronous
{
    
}

// Clears all delegates and blocks, then cancels the request
- (void)clearDelegatesAndCancel
{
    
}

// Called when a request starts, lets the delegate know via didStartSelector
- (void)requestStarted
{
    
}

// Called when a request completes successfully, lets the delegate know via didFinishSelector
- (void)requestFinished
{
    
}

// Called when a request fails, and lets the delegate know via didFailSelector
- (void)failWithError:(NSError *)theError
{
    
}

- (void)startRequest
{
    
}
- (void)updateStatus:(NSTimer *)timer
{
    
}
- (void)checkRequestStatus
{
    
}
- (void)reportFailure
{
    
}
- (void)reportFinished
{
    
}
- (void)markAsFinished
{
    
}
- (BOOL)shouldTimeOut
{
    return YES;
}
@end
