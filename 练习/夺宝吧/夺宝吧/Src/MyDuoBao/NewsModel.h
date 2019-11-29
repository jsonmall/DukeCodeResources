//
//  NewsModel.h
//  夺宝吧
//
//  Created by xiaocai on 15/8/6.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject
// 消息自增id
@property (nonatomic,strong)NSString *news_id;
// 标题
@property (nonatomic,strong)NSString *news_title;
// 创建时间
@property (nonatomic,strong)NSString *news_time;
//是否阅读过
@property (nonatomic,assign)int isScanfedFlag;
@end
