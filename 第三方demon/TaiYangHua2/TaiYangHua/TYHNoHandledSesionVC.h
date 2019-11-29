//
//  TYHNoHandledSesionVC.h
//  TaiYangHua
//
//  Created by Vieene on 15/12/22.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TYHSessionModel;
@protocol noHandledSesionDelegate <NSObject>
@required
/**
 *  点击了受理按钮之后的动作
 *
 */
-(void)noHandledSesionVCDidClickHandBtn:(TYHSessionModel *)model;

@end

@interface TYHNoHandledSesionVC : UIViewController
@property (nonatomic,weak)id <noHandledSesionDelegate> delegate;


/**
 *  刷新界面
 */
- (void)reloadTableView;

@end
