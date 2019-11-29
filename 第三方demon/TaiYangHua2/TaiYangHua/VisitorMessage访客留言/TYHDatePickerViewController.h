//
//  TYHDatePickerViewController.h
//  TaiYangHua
//
//  Created by HHLY on 15/12/24.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DatePickerBlock)(NSString *beginTime, NSString *endTime);

//@class TYHVisitorLeaveMsgInfo;
@interface TYHDatePickerViewController : UIViewController

//@property (nonatomic, strong) TYHVisitorLeaveMsgInfo *leaveMsgInfo;
@property (nonatomic, copy) DatePickerBlock pickerBlock;
@property (nonatomic, copy) NSString        *endDateString;
@property (nonatomic, copy) NSString        *startDateString;

@end
