//
//  UserModel.h
//  TaiYangHua
//
//  Created by Vieene on 15/12/29.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (nonatomic,copy)NSString * loginSource;

@property (nonatomic,copy)NSString * username;

@property (nonatomic,copy)NSString * groupName;

@property (nonatomic,copy)NSString * nickName;

@property (nonatomic,copy)NSString * loadRate;

@property (nonatomic,copy)NSString * userId;
@end
