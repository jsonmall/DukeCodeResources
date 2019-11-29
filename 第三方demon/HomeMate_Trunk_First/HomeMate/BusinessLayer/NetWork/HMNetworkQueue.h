//
//  HMNetworkQueue.h
//  HomeMate
//
//  Created by Air on 15/9/11.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMNetworkQueue : NSOperationQueue


@property (assign, readonly) int requestsCount;

// Convenience constructor
+ (id)queue;

// Call this to reset a queue - it will cancel all operations, clear delegates, and suspend operation
- (void)reset;

// All ASINetworkQueues are paused when created so that total size can be calculated before the queue starts
// This method will start the queue
- (void)go;

@end
