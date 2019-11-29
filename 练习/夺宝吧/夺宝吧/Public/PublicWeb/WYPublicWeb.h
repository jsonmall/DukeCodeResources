//
//  WYPublicWeb.h
//  夺宝吧
//
//  Created by xiaocai on 15/6/23.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYPublicWeb : UIViewController
//网页链接
@property (nonatomic,strong)NSString *urlStr;
//上方标题
@property (nonatomic,strong)NSString *mtitle;
//是否dismiss退出标志
@property (nonatomic,assign)BOOL isDIsmissFLag;
@end
