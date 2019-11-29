//
//  TYHTranslationViewController.h
//  TaiYangHua
//
//  Created by Lc on 15/12/30.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SureTranslationBlock)();

@class TYHSessionModel;
@interface TYHTranslationViewController : UITableViewController

@property (nonatomic, strong) TYHSessionModel *sessionModel;
@property (nonatomic, copy) SureTranslationBlock sureTranslationBlock;

@end