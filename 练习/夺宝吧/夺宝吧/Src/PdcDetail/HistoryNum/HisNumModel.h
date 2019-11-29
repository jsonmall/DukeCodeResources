//
//  HisNumModel.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/6.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HisNumModel : NSObject
//段标题
@property (nonatomic,strong)NSString *sectionTitle;
//号码
@property (nonatomic,strong)NSString *rownum;
//是否是默认号码
@property (nonatomic,assign)BOOL numFlag;
//section内容
@property (nonatomic,strong)NSMutableArray *sectionData;
@end
