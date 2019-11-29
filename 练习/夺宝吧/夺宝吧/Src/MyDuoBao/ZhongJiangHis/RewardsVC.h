//
//  RewardsVC.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/21.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RewardsVC : UIViewController
//是否是自己的中奖记录标志
@property (nonatomic,assign)BOOL isMyRecordFlag;
//用户id
@property (nonatomic,strong)NSString *userId;
@property (nonatomic,assign)BOOL isOthersFlag;
@end
