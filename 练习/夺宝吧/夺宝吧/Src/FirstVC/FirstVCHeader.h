//
//  FirstVCHeader.h
//  夺宝吧
//
//  Created by xiaocai on 15/6/15.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstVC.h"
#import "NewPublishPdcModel.h"
@interface FirstVCHeader : UIView
@property (nonatomic,weak)FirstVC *father;

//是否是选择性刷新
@property (nonatomic ,assign) BOOL isFilterFresh;
//请求最新揭晓数据
- (void)startRequestForNews;
//请求数据
- (void)startRequestForData;

@end
