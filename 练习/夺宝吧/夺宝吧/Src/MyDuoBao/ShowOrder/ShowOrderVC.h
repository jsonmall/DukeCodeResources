//
//  ShowOrderVC.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/28.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowOrderVC : UIViewController
//是否商品详情里面中奖记录标志
@property (nonatomic,assign)BOOL isDetailFlag;
//是否是自己的中奖记录标志
@property (nonatomic,assign)BOOL isMyRecordFlag;
//商品sid
@property (nonatomic,strong)NSString *pdc_sid;
//用户id
@property (nonatomic,strong)NSString *userId;

@end
