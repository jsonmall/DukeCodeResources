//
//  NSString+DocumentPath.m
//  气泡
//
//  Created by zzy on 14-5-15.
//  Copyright (c) 2014年 zzy. All rights reserved.
//

#import "NSString+DocumentPath.h"

@implementation NSString (DocumentPath)
+(NSString *)cachePathWith:(NSString *)fileName
{
    NSString * folerName = @"voiceCache";
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString * documentsDirectory = [[paths objectAtIndex:0] stringByAppendingPathComponent:folerName];
    NSFileManager *  fileManager =[[NSFileManager alloc]init];
    if (![fileManager fileExistsAtPath:documentsDirectory]) {
        if(![fileManager createDirectoryAtPath:documentsDirectory withIntermediateDirectories:YES attributes:nil error:nil]){
            DDLogError(@"创建成功");
        }else{
            DDLogError(@"创建不成功");
        };
    }
    return [documentsDirectory stringByAppendingPathComponent:fileName];
}
@end
