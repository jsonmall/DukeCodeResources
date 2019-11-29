//
//  QTInvitationDetailViewController.h
//  QTime
//
//  Created by mima on 15/7/21.
//  Copyright (c) 2015年 Mark. All rights reserved.
//


#import "QTBaseSettingsViewController.h"

@interface QTInvitationDetailViewController : QTBaseSettingsViewController

/**
 *  需要使用timeId来创建，invitation内的timeID
 */
- (instancetype)initWithTimeId:(NSString *)timeId;

- (void)setupGroups;

@end
