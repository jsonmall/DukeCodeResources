//
//  VhAPSocket.m
//  ViHomeProLib
//
//  Created by liqiang on 15/8/6.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "VhAPSocket.h"
#import "GCDAsyncSocket.h"
#import "VhGetIp.h"
#import "AsyncSocket.h"
#include <arpa/inet.h> 
#import <netdb.h>
#import <sys/socket.h>
@interface VhAPSocket () <GCDAsyncSocketDelegate>
{
    GCDAsyncSocket * _socket;

}

@property (nonatomic, assign) id <VhApSocketDelegate> delegate;

@end


@implementation VhAPSocket


- (instancetype)initWithDelegate:(id <VhApSocketDelegate>)delegate {
    if (self = [super init]) {
        self.delegate = delegate;

    }
    
    return self;
}

//断开连接
- (void)disconnectSocket
{
    if(_socket)
    {
        if ([_socket isConnected]) {
            [_socket disconnect];
            [_socket setDelegate:nil];
        }
    }
}
- (void)connectToHost {
    if ([_socket isConnected]) {
        [self disconnectSocket];

    }
    _socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];

//    _socket = [[AsyncSocket alloc] initWithDelegate:self];
    HM_LOG(@"连接Socket = %@",_socket);
    
    
    NSString * ip = [VhGetIp getIp];
    HM_LOG(@"连接Socket = %@ ip = %@",_socket,ip);

    NSError *error = nil;
    uint16_t port = 8295;
    BOOL connected = [_socket connectToHost:ip onPort:port error:&error];
    if (connected) {

    }

}
/**
 *  判断是否连接
 *
 *  @return 
 */
- (BOOL)isConnectedToCOCO {
    return [_socket isConnected];
}
//发送数据
- (void)sendData:(NSData *)binaryData{
    
    if(_socket) {
        [_socket writeData:binaryData withTimeout:-1 tag:0];
    }
}
#pragma mark -  GCDAsyncSocketDelegate

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    
    [self.delegate onDeliverData:data];
    
    [sock readDataWithTimeout:-1 tag:tag];
}
- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port {
    [sock readDataWithTimeout:-1 tag:0];
    
    [self.delegate didConnected];
}
- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag {
    [sock readDataWithTimeout:-1 tag:tag];
}
- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err {
    HM_LOG(@"断开Socket = %@",sock);
    if (sock == nil) {
        HM_LOG(@"sock 为空值了");
    }
    if(err && [err code] == GCDAsyncSocketConnectTimeoutError) {
        if (self.delegate) {
            [self.delegate onConnectTimeout];
        }
    }else {
        if (self.delegate) {
            [self.delegate onDisconnectWithError:err];
        }
    }
}
#pragma mark -  AsyncSocketDelegate
- (void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    [self.delegate onDeliverData:data];
    
    [sock readDataWithTimeout:-1 tag:tag];

}
- (void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag {
    [sock readDataWithTimeout:-1 tag:tag];

}
- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port {
    [sock readDataWithTimeout:-1 tag:0];
    
    [self.delegate didConnected];
}
- (void)onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err {
    HM_LOG(@"断开Socket = %@",sock);
    if (sock == nil) {
        HM_LOG(@"sock 为空值了");
    }
    if(err && [err code] == AsyncSocketConnectTimeoutError) {
        if (self.delegate) {
            [self.delegate onConnectTimeout];
        }
    }else {
        if (self.delegate) {
            [self.delegate onDisconnectWithError:err];
        }
    }
}
@end
