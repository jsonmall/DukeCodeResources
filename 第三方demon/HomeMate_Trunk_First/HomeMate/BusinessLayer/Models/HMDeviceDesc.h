//
//  DeviceDesc.h
//  HomeMate
//
//  Created by liuzhicai on 16/1/13.
//  Copyright © 2016年 Air. All rights reserved.
//

@interface HMDeviceDesc : NSObject

@property (nonatomic, copy)NSString *deviceDescId;

@property (nonatomic, copy)NSString *model;

@property (nonatomic, copy)NSString *productModel;

@property (nonatomic, copy)NSString *endpointSet;

@property (nonatomic, copy)NSString *picUrl;
@property (nonatomic, copy)NSString *updateTime;
@property (nonatomic, copy)NSString *createTime;
@property (nonatomic, assign)int delFlag;

// 根据32位标识符能查出对应的设备信息
+ (instancetype)objectWithModel:(NSString *)model;

+ (instancetype)objectFromDictionary:(NSDictionary *)dict;

- (BOOL)insertObject;

@end
