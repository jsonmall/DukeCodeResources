//
//  JMDatePickerView.h
//  TestProductForTableView
//
//  Created by HHLY on 15/12/29.
//  Copyright © 2015年 HHLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMDatePickerView : UIView

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *resultDateString;

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title imageName:(NSString *)imageName;

- (void)setCurrentSeleted:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

@end
