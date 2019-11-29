//
//  TYHTimeTools.m
//  TaiYangHua
//
//  Created by HHLY on 15/12/30.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import "TYHTimeTools.h"

@implementation TYHTimeTools
+(NSString *)analysisTimeStamp:(NSString *)timeStamp
{
//    NSInteger stame = (long)(timeStamp - 621355968000000000) / 10000000;
    
//#if __LP64__ || (TARGET_OS_EMBEDDED && !TARGET_OS_IPHONE) || TARGET_OS_WIN32 || NS_BUILD_32_LIKE_64
//    NSInteger timeStampNum = [timeStamp integerValue] / 1000;
//#else
    long long timeStampNum = [timeStamp longLongValue] / 1000;
//#endif
    
//    NSInteger stame = timeStampNum / 1000;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy.MM.dd HH:mm";
    NSDate *orderDate = [NSDate dateWithTimeIntervalSince1970:timeStampNum];
    
    return [dateFormatter stringFromDate:orderDate];
}

+ (NSString *)timeStringWithStamp:(NSString *)timeStamp
{
    if (!timeStamp || [timeStamp isEqualToString:@"(null)"] || [timeStamp isEqualToString:@""]) {
        return @"";
    }
    
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSDate *date = [NSDate date];
    NSDateComponents *component = [calender components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
    
    long long timeStampNum = [timeStamp longLongValue] / 1000;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm";
    NSDate *orderDate = [NSDate dateWithTimeIntervalSince1970:timeStampNum];
    
    NSString *dateString = [dateFormatter stringFromDate:orderDate];
    
    NSInteger currentDay = [component day];
    NSInteger dayOfDateString = [self dayWithDateStr:dateString];
    if (currentDay == dayOfDateString) {
        return [dateString substringWithRange:NSMakeRange(11, 5)];
    }
    else if (currentDay - dayOfDateString == 1) {
        return @"昨天";
    }
    else {
        return [dateString substringWithRange:NSMakeRange(5, 5)];
    }
}

+ (NSInteger)tampTimeWithDateStr:(NSString *)dateStr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSDate *resultDate = [formatter dateFromString:dateStr];
    
    NSTimeInterval stampTime = [resultDate timeIntervalSince1970];
    
    return stampTime;
}

+(NSInteger)yearWithDateStr:(NSString *)dateStr
{
    NSString *subString = [dateStr substringWithRange:NSMakeRange(0, 4)];
    return [subString integerValue];
}

+ (NSInteger)monthWithDateStr:(NSString *)dateStr
{
    NSString *subString = [dateStr substringWithRange:NSMakeRange(5, 2)];
    return [subString integerValue];
}

+ (NSInteger)dayWithDateStr:(NSString *)dateStr
{
    NSString *subString = [dateStr substringWithRange:NSMakeRange(8, 2)];
    return [subString integerValue];
}

@end
