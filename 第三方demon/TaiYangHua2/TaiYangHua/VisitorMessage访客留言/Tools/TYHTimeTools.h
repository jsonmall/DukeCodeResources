//
//  TYHTimeTools.h
//  TaiYangHua
//
//  Created by HHLY on 15/12/30.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYHTimeTools : NSObject

+ (NSString *)analysisTimeStamp:(NSString *)timeStamp;

+ (NSString *)timeStringWithStamp:(NSString *)timeStamp;

+ (NSInteger)tampTimeWithDateStr:(NSString *)dateStr;
/**
 *  根据时间字符串获得年份
 *
 *  @param dateStr 时间字符串格式：yyyy-MM-dd
 *
 *  @return 返回年份
 */
+ (NSInteger)yearWithDateStr:(NSString *)dateStr;
+ (NSInteger)monthWithDateStr:(NSString *)dateStr;
+ (NSInteger)dayWithDateStr:(NSString *)dateStr;

@end
