//
//  HMTimerAndCountdownNavBarView.h
//  HomeMate
//
//  Created by liuzhicai on 15/12/7.
//  Copyright © 2015年 Air. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,KTagType) {
    KTagTypeTimer,
    KTagTypeCountdown
};

@protocol  HMTimerAndCountdownNavBarViewDelegate <NSObject>

- (void)didClickBackBtn;

- (void)didClickRightBtn;

- (void)pickTimerOrCountdownWithTag:(KTagType)tagType;

@end

@interface HMTimerAndCountdownNavBarView : UIView

@property (nonatomic, weak)id<HMTimerAndCountdownNavBarViewDelegate> delegate;

@property (nonatomic, strong)UIButton *timerBtn;

@property (nonatomic, strong)UIButton *countdownBtn;


@property (nonatomic, strong)UIButton *rightAddBtn;



- (instancetype)initWithFrame:(CGRect)frame delegate:(id<HMTimerAndCountdownNavBarViewDelegate>)delegate;

- (void)setTagType:(KTagType)type;


@end
