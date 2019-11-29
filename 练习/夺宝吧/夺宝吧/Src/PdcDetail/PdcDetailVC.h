//
//  PdcDetailVC.h
//  夺宝吧
//
//  Created by xiaocai on 15/6/30.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailHeader.h"
@interface PdcDetailVC : UIViewController
//商品id
@property (nonatomic,strong)NSString *pdc_id;
//是否sid标志
@property (nonatomic,assign)BOOL isSidFlag;
//刷新表头
- (void)reloadTabHeaderWithDic:(NSDictionary *)dic;
//刷新圆角通知
- (void)updateTongZhi;
@end
