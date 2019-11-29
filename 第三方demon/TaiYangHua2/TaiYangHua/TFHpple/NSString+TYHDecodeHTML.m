//
//  NSString+TYHDecodeHTML.m
//  TaiYangHua
//
//  Created by Lc on 16/1/7.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "NSString+TYHDecodeHTML.h"

@implementation NSString (TYHDecodeHTML)

+ (instancetype)decodeHTML:(NSString *)string
{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
//    DDLogDebug(@"%@",string);
    TFHpple * doc       = [[TFHpple alloc] initWithHTMLData:data];
//    TFHppleElement * element  = [doc peekAtSearchWithXPathQuery:@"//p"];
    
    NSMutableString *contentStr = [NSMutableString string];
    NSArray *elementArr = [doc searchWithXPathQuery:@"//p"];
    
    if (elementArr.count == 0) {
        return string;
    }else{
        [contentStr appendString:[elementArr[0] content]];
        for (int i = 1; i < elementArr.count; i ++) {
//            DLog(@"element string: %@", [elementArr[i] content]);
            [contentStr appendString:@"\n"];
            [contentStr appendString:[elementArr[i] content]];
        }
        
//        for (TFHppleElement *tempElement in elementArr) {
//            NSLog(@"element string: %@", [tempElement content]);
//            [contentStr appendString:[tempElement content]];
//        }
    }
    
    
    
   return contentStr;
}

@end
