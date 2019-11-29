//
//  NumView.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/23.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumView : UIView
//隐藏子控件
- (void)hiddenSubViews:(BOOL)hiddenFlag;
//填充数据
- (void)fillViewWithPhone:(NSString *)phone QQ:(NSString *)qq ZFB:(NSString *)zfb;
@end
