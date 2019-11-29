//
//  TYHInternalSocket.h
//  TaiYangHua
//
//  Created by Lc on 16/3/14.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYHInternalSocket : NSObject

@property (copy, nonatomic) void(^pushMessageBlock) (id);
@property (copy, nonatomic) void(^pushMessageListBlock) (id);
+ (instancetype)shareInstance;

- (void)didReceivePushMessage:(id)json;

@end
