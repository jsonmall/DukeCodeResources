//
//  HMCountdownViewController.h
//  HomeMate
//
//  Created by liuzhicai on 15/12/7.
//  Copyright © 2015年 Air. All rights reserved.
//

#import "CommonNaviController.h"

typedef NS_ENUM(NSInteger, KOperationType){
    KOperationTypeAdd,   // 增加倒计时
    KOperationTypeEdit   // 编辑倒计时
};

@interface HMCountdownViewController : CommonNaviController

@property (nonatomic, assign)KOperationType operationType;

@property (nonatomic, strong)HMDevice *device;

@property (nonatomic, strong)HMCountdownModel *countdownObj;

@end
