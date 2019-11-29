//
//  HMFamilyMembersListViewController.h
//  HomeMate
//
//  Created by orvibo on 15/9/8.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "CommonNaviController.h"

@interface HMFamilyMembersListViewController : CommonNaviController

@end



@interface HMFamilyMembersListCell : UITableViewCell
@property (nonatomic, strong) UIButton *continueToAddBtn;
@property (nonatomic, strong) UIButton *deleteBtn;
@end