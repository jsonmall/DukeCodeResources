//
//  ZBExpressionSectionBar.h
//  MessageDisplay
//
//  Created by zhoubin@moshi on 14-5-13.
//  Copyright (c) 2014年 Crius_ZB. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ZBExpressionSectionBarDelegate <NSObject>
@optional

/*
 * 点击表情发送代理
 *
 */
- (void)didClickSendFaceBtn;

@end

@interface ZBExpressionSectionBar : UIView


@property (nonatomic,weak)id <ZBExpressionSectionBarDelegate> delegate;

@end
