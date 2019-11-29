//
//  TYHBaseSocket.h
//  TaiYangHua
//
//  Created by HHLY on 16/5/5.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, AuthenState) {
    UserAuthenNone,
    UserAuthenning,
    UserAuthenSuccessed,
    UserAuthenFail
};

@interface TYHBaseSocket : NSObject

@property (assign, nonatomic) AuthenState state;
@property (assign, nonatomic, getter=isLoginned) BOOL loginned;

- (void)reconnectHost;
- (void)disconnectHost;

- (void)connectService;

- (void)acceptedMessage:(NSDictionary *)msgDic;

@end
