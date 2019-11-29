//
//  HMTask.h
//  HomeMate
//
//  Created by Air on 15/9/11.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMNetworkTask : NSOperation

@property (assign, nonatomic) id delegate;
@property (retain, nonatomic) id queue;

@property (assign) SEL didStartSelector;
@property (assign) SEL didFinishSelector;
@property (assign) SEL didFailSelector;
@property (retain) NSError *error;
@property (assign,readonly) BOOL complete;
@property (assign,readonly) int responseStatusCode;
@property (retain,readonly) NSString *responseStatusMessage;
@property (assign) NSTimeInterval timeOutSeconds;
@property (retain) NSDictionary *userInfo;
@property (assign) NSInteger tag;
@property (assign, readonly) BOOL inProgress;
@property (assign) int numberOfTimesToRetryOnTimeout;
@property (assign, readonly) int retryCount;

// Run a request synchronously, and return control when the request completes or fails
- (void)startSynchronous;

// Run request in the background
- (void)startAsynchronous;

// Clears all delegates and blocks, then cancels the request
- (void)clearDelegatesAndCancel;

// Called when a request starts, lets the delegate know via didStartSelector
- (void)requestStarted;

// Called when a request completes successfully, lets the delegate know via didFinishSelector
- (void)requestFinished;

// Called when a request fails, and lets the delegate know via didFailSelector
- (void)failWithError:(NSError *)theError;
@end
