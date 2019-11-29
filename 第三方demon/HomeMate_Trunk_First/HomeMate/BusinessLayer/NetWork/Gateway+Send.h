//
//  Gateway+Send.h
//  Vihome
//
//  Created by Air on 15-1-27.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "Gateway.h"

@interface Gateway (Send)

//-(int)getLength:(NSData *)data;
- (void)handleUdpTcpData:(NSData *)data socket:(GlobalSocket *)socket;

//- (void)savePrData:(NSData*)data;// 处理属性报告
- (void)onlySendData:(BaseCmd *)cmd; // 使用场景，调光的时候，需要密集发送多条命令

- (void)cancelALTimeout:(NSNumber *)serialNo;
- (void)didSendCmd:(BaseCmd *)cmd completion:(SocketCompletionBlock)completion;
- (BOOL)socket:(GlobalSocket *)socket didReceiveData:(NSData *)data;

@end
