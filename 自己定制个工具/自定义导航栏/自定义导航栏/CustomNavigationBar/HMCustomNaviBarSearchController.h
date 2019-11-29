//
//  CustomNaviBarSearchController.h
//  CustomNavigationBarDemo
//
//  Created by jimple on 14-1-6.
//  Copyright (c) 2014年 Jimple Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HMCustomViewController;
@class HMCustomNaviBarSearchController;
@protocol HMCustomNaviBarSearchControllerDelegate <NSObject>

- (void)naviBarSearchCtrl:(HMCustomNaviBarSearchController *)ctrl searchKeyword:(NSString *)strKeyword;
- (void)naviBarSearchCtrlCancel:(HMCustomNaviBarSearchController *)ctrl;

@optional
- (void)naviBarSearchCtrlClearKeywordRecord:(HMCustomNaviBarSearchController *)ctrl;

@end


@interface HMCustomNaviBarSearchController : NSObject

@property (unsafe_unretained) id<HMCustomNaviBarSearchControllerDelegate> delegate;

- (id)initWithParentViewCtrl:(HMCustomViewController *)viewCtrl;

- (void)resetPlaceHolder:(NSString *)strMsg;

// 导航条上的关键字输入框分两种
// 1、由按钮触发，点击按钮后显示输入框，结束后销毁输入框现实按钮。
- (void)showTempSearchCtrl;

// 2、导航条一直显示输入框。
- (void)showFixationSearchCtrl;
- (void)showFixationSearchCtrlOnTitleView;

- (void)startSearch;
- (void)removeSearchCtrl;

- (void)setRecentKeyword:(NSArray *)arrRecentKeyword;
- (void)setKeyword:(NSString *)strKeyword;


@end
