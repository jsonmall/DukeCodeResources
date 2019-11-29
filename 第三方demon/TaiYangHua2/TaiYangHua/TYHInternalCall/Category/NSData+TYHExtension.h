//
//  NSData+TYHExtension.h
//  TaiYangHua
//
//  Created by Lc on 16/4/11.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (TYHExtension)
+ (NSData *)imageDataWithURL:(NSString *)imageURL;
- (NSData *)compressImage:(UIImage *)image toMaxFileSize:(NSInteger)maxFileSize;
@end
