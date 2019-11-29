//
//  Calender.m
//  TestProductForTableView
//
//  Created by HHLY on 15/12/29.
//  Copyright © 2015年 HHLY. All rights reserved.
//

#import "Calender.h"

@implementation Calender

- (instancetype)initWithDate:(NSDate *)date
{
    self = [super init];
    if (self) {
        NSCalendar *calender = [NSCalendar currentCalendar];
        NSDateComponents *component = [calender components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
        
        self.currentYear = [component year];
        self.currentMonth = [component month];
        self.currentDay = [component day];
    }
    return self;
}
// 默认从当前时间往前推进15年
- (NSArray *)years
{
    NSMutableArray *years = [NSMutableArray array];
    for (int i = 15; i >= 0; i--) {
        [years addObject:@(self.currentYear - i)];
    }
    
    return years;
}

- (NSArray *)months
{
    NSMutableArray *monthArr = [NSMutableArray array];
    for (int i = 1; i <= 12; i++) {
        [monthArr addObject:@(i)];
    }
    return monthArr;
}

- (NSArray *)days
{
    return [Calender dayValuesOfYear:self.currentYear month:self.currentMonth];
}

+ (BOOL)isLeapYear:(NSInteger)year
{
    return (year % 4 == 0 && year%100 != 0 ) || (year % 400 ==0);
}

#pragma mark -- class method
+(NSArray *)dayValuesOfYear:(NSInteger)year month:(NSInteger)month
{
    NSInteger dayNum = 31;
    if (month == 2) {
        dayNum = [self isLeapYear:year] ? 29 : 28;
    }
    else if (month == 4 || month == 6 || month == 9 || month == 11)
    {
        dayNum = 30;
    }
    
    NSMutableArray *days = [NSMutableArray array];
    for (int i = 1; i <= dayNum; i++) {
        [days addObject:@(i)];
    }
    return days;
}

@end
