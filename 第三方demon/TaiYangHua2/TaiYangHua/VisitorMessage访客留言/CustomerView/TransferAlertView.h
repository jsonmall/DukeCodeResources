//
//  TransferAlertView.h
//  TestProductForTableView
//
//  Created by HHLY on 16/1/7.
//  Copyright © 2016年 HHLY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TYHTransferCusInfo.h"
/// 调用之后需要调用 dismiss，代理的方法里也要 dismiss
@class TransferAlertView;
@protocol TransferAlertViewDelegate <NSObject>

- (void)transferAlertView:(TransferAlertView *)alertView clickSureView:(BOOL)sureSeleted;

@end

@interface TransferAlertView : UIView
/** 提示语 */
@property (nonatomic, copy) NSString *msgContent;
@property (nonatomic, assign) id<TransferAlertViewDelegate> delegate;
@property (nonatomic, strong) TYHTransferCusInfo *transferCusInfo;

- (instancetype)initWithContent:(NSString *)content;

- (void)show;
- (void)dismiss;

@end
