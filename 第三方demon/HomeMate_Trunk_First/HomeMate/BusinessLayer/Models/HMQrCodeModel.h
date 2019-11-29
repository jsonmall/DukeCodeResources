//
//  QrCodeModel.h
//  HomeMate
//
//  Created by liuzhicai on 16/1/13.
//  Copyright © 2016年 Air. All rights reserved.
//

@interface HMQrCodeModel : NSObject

@property (nonatomic, copy)NSString *qrCodeId;

@property (nonatomic, assign)int qrCodeNo;

// 添加入口类型
@property (nonatomic, copy)NSString *type;
@property (nonatomic, copy)NSString *picUrl;
@property (nonatomic, copy)NSString *updateTime;
@property (nonatomic, copy)NSString *createTime;
@property (nonatomic, assign)int delFlag;

+ (instancetype)objectwithQrCode:(NSString *)qrCodeNo;

+ (instancetype)objectFromDictionary:(NSDictionary *)dict;

- (BOOL)insertObject;


@end
