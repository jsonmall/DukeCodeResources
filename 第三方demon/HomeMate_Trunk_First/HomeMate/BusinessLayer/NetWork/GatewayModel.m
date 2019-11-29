//
//  GatewayModel.m
//  HomeMate
//
//  Created by Air on 15/10/20.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "GatewayModel.h"

@implementation GatewayModel

+ (id)shareInstance
{
    Singleton();
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.taskQueue = [NSMutableDictionary dictionary];
    }
    return self;
}
@end
