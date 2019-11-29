//
//  VihomeAction.m
//  Vihome
//
//  Created by Ned on 4/21/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "HMAction.h"

@implementation HMAction

- (void)copyValueFromCommonObject:(id<OrderProtocol>)object
{
    self.value1 = object.value1;
    self.value2 = object.value2;
    self.value3 = object.value3;
    self.value4 = object.value4;
    self.bindOrder = object.bindOrder;
}

- (void)fillValueToCommonObject:(id<OrderProtocol>)object
{
    object.value1 = self.value1;
    object.value2 = self.value2;
    object.value3 = self.value3;
    object.value4 = self.value4;
    object.bindOrder = self.bindOrder;
}

- (NSDictionary *)dictionary
{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    
    [dic setObject:[NSNumber numberWithInt:self.value1] forKey:@"value1"];
    [dic setObject:[NSNumber numberWithInt:self.value2] forKey:@"value2"];
    [dic setObject:[NSNumber numberWithInt:self.value3] forKey:@"value3"];
    [dic setObject:[NSNumber numberWithInt:self.value4] forKey:@"value4"];
    if (!self.bindOrder) {
        self.bindOrder = @"NULL";
    }
    [dic setObject:self.bindOrder forKey:@"order"];
    
    return dic;
}

- (id)copyWithZone:(NSZone *)zone
{
    HMAction *object = [[HMAction alloc]init];
    
    object.bindOrder = self.bindOrder;
    object.value1 = self.value1;
    object.value2 = self.value2;
    object.value3 = self.value3;
    object.value4 = self.value4;
    object.hue = self.hue;
    object.saturation = self.saturation;
    return object;
}

@end
