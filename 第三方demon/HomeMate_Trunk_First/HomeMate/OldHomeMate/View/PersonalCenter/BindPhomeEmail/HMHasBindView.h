//
//  UnBindView.h
//  HomeMate
//
//  Created by orvibo on 15/8/14.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HMHasBindViewDelegate;

@interface HMHasBindView : UIView

/**
 *  初始化显示已经绑定手机号或邮箱的页面(页面显示有一个手机或邮箱的图标)
 *
 *  @param frame
 *  @param isEmail   YES:email页面    NO:手机页面
 *  @param numberStr 旧的邮箱或手机号
 *  @param delegate
 *  @return
 */
-(instancetype)initWithFrame:(CGRect)frame email:(BOOL)isEmail numberStr:(NSString *)numberStr delegate:(id<HMHasBindViewDelegate>)delegate;

@end


@protocol HMHasBindViewDelegate <NSObject>

/**
 *  点击更换邮箱/手机号
 */
-(void)clickReplaceBindingButton;

@end
