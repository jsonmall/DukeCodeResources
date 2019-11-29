//
//  TYHBaseSessionViewController.h
//  TaiYangHua
//
//  Created by Vieene on 15/12/30.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import "TYHBaseViewController.h"
#import "TYHDataSource.h"
@class ZBMessageShareMenuView;
@class TYHSessionModel;
@class ZBMessageInputView;
extern CGFloat keyBordViewH;

@interface TYHBaseSessionViewController : TYHBaseViewController
@property (nonatomic,strong) ZBMessageShareMenuView *shareMenuView;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) TYHDataSource *DataSource;
@property (nonatomic,strong)TYHSessionModel *sessionModel;
@property (nonatomic,strong) ZBMessageInputView *keyBordView;
@property (nonatomic,assign) CGFloat deltaY;
@property (nonatomic,assign) BOOL isBottom;


/**
 *  当前编辑菜单所关联的消息
 */
@property (nonatomic,readonly) TYHChartCellFrame *messageForMenu;

-(void)keyboardShow:(NSNotification *)note;
-(void)keyboardHide:(NSNotification *)note;

/**
 *  收回键盘和表情、分享界面
 */
- (void)recoverKeyinputView;

/**
 *  键盘复位
 */
- (void)resumeKeyboardView;

/**
 *  tabview滑动到最底端
 *  @param animation 是否动画
 */
-(void)tableViewScrollCurrentIndexPathWithAnimation:(BOOL)animation;


@end
