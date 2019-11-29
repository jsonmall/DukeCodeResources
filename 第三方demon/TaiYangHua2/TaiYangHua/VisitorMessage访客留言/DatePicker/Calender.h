//
//  Calender.h
//  TestProductForTableView
//
//  Created by HHLY on 15/12/29.
//  Copyright © 2015年 HHLY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calender : NSObject
{
    NSInteger _currentYear;
    NSInteger _currentMonth;
    NSInteger _currentDay;
}

@property (nonatomic, strong) NSDate *currentDate;

@property (nonatomic, assign) NSInteger currentYear;
@property (nonatomic, assign) NSInteger currentMonth;
@property (nonatomic, assign) NSInteger currentDay;

- (instancetype)initWithDate:(NSDate *)date;
// 获取年份数组
- (NSArray *)years;
// 获取月份
- (NSArray *)months;
// 获取该月的天数
- (NSArray *)days;

+ (NSArray *)dayValuesOfYear:(NSInteger)year month:(NSInteger)month;

@end
