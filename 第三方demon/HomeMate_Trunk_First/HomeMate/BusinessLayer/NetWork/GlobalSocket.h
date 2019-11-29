//
//  GlobalSocket.h
//  HomeMate
//
//  Created by Air on 15/8/14.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "GCDAsyncSocket.h"

@interface GlobalSocket : GCDAsyncSocket

@property(nonatomic,strong)NSString *uid;
@property(nonatomic,strong)NSString *session;
@property(nonatomic,strong)NSString *encryptionKey;
@property(nonatomic,assign) BOOL isConnectToServer;
@property(nonatomic,assign) BOOL updateTimeStamp;
@property(nonatomic,assign,readonly) BOOL timeStampExpired;

@end
