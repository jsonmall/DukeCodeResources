//
//  NSString+Message.m
//  MessageDisplay
//
//  Created by zhoubin@moshi on 14-5-10.
//  Copyright (c) 2014年 Crius_ZB. All rights reserved.
//

#import "NSString+Message.h"

@implementation NSString (Message)

- (NSString *)stringByTrimingWhitespace {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSUInteger)numberOfLines {
    return [[self componentsSeparatedByString:@"\n"] count] + 1;
}
- (NSString *)strSwitchFromJsonStr
{
    if (self == nil) {
        return @"";
    }
    //{"sie":0.300355,"thumb":true,"fileName":"2016-04-0109:19:39.png"}
    NSData* jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary * json = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    if (json == nil) {
        return self;
    }
    NSMutableString *str = [[NSMutableString alloc] init];
    
    if ([[json allKeys] containsObject:@"wds"]) {
        NSArray *strArray = json[@"wds"];
        if (strArray.count == 0) {
            return @"";
        }
        [str appendString:strArray[0]];
        for (int i = 1; i<strArray.count; i ++) {
            [str appendString:@"\n"];
            [str appendString:strArray[i]];
        }
    }else{
        if ([[json allKeys] containsObject:@"fileName"]) {
            [str appendString:self];
        }
        
    }
    //    DLog(@"%@",str);
    return str;
    
}
- (NSString *)getVoiceCacheUrlstr
{
    NSString * folerName = @"voiceCache";
    //Caches:
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString * documentsDirectory = [[paths objectAtIndex:0] stringByAppendingPathComponent:folerName];

    NSArray *strArray = [self componentsSeparatedByString:@"/"];
    NSMutableString *localPathstr = [strArray lastObject];

    return [documentsDirectory stringByAppendingPathComponent:localPathstr];
}

@end
