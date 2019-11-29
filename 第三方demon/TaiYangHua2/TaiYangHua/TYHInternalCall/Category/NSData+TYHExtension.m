//
//  NSData+TYHExtension.m
//  TaiYangHua
//
//  Created by Lc on 16/4/11.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "NSData+TYHExtension.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIImage+Utility.h"

@implementation NSData (TYHExtension)
+ (NSData *)imageDataWithURL:(NSString *)imageURL
{
    NSData *imageData = nil;
    NSURL *url = [NSURL fileURLWithPath:imageURL];
    if ([imageURL hasPrefix:@"http:"]) {
        url = [NSURL URLWithString:imageURL];
    }
    BOOL isExit = [[SDWebImageManager sharedManager] diskImageExistsForURL:url];
    if (isExit) {
        NSString *cacheImageKey = [[SDWebImageManager sharedManager] cacheKeyForURL:url];
        if (cacheImageKey.length) {
            NSString *cacheImagePath = [[SDImageCache sharedImageCache] defaultCachePathForKey:cacheImageKey];
            if (cacheImagePath.length) {
                imageData = [NSData dataWithContentsOfFile:cacheImagePath];
            }
        }
    }
    return imageData;
}

- (NSData *)compressImage:(UIImage *)image toMaxFileSize:(NSInteger)maxFileSize
{
    CGFloat compression = 0.9f;
    CGFloat maxCompression = 0.1f;
    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    while ([imageData length] > maxFileSize && compression > maxCompression) {
        compression -= 0.2;
        imageData = UIImageJPEGRepresentation(image, compression);
    }
    
    
    if (imageData.length/1024.0/1024.0 > 0.2) {
        
        CGSize newSize = CGSizeMake(image.size.width /2.0, image.size.height/2.0);
        UIImage *newImage =  [image resize:newSize];
        
        CGFloat compression = 0.9f;
        CGFloat maxCompression = 0.1f;
        imageData = UIImageJPEGRepresentation(newImage, compression);
        while ([imageData length] > maxFileSize && compression > maxCompression) {
            compression -= 0.2;
            imageData = UIImageJPEGRepresentation(newImage, compression);
        }
    }

    return imageData;
    
}
@end
