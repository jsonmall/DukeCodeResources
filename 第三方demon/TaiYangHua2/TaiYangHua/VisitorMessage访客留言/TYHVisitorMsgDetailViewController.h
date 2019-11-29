//
//  TYHVisitorMsgDetailViewController.h
//  TaiYangHua
//
//  Created by HHLY on 15/12/24.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYHVisitorMsgDetailViewController : UIViewController

@property (nonatomic, assign) NSInteger msgId;
/** 处理状态，0-未处理，1-已处理 */
@property (nonatomic, assign) NSInteger handleState;
/** 客服处理留言权限 */
@property (nonatomic, assign) BOOL canHandleLeaveMsg;

@end
