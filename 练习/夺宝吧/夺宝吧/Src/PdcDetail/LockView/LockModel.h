//
//  LockModel.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/20.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LockModel : NSObject
// 用户uid
@property (nonatomic,strong)NSString *lock_uid;
// 订单号
@property (nonatomic,strong)NSString *lock_code;
// 购买次数
@property (nonatomic,strong)NSString *lock_gonum;
// 购买时间
@property (nonatomic,strong)NSString *lock_time;
@end
