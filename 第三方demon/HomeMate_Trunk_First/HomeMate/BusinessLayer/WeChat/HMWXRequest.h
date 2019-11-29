//
//  HMWXRequest.h
//  JQWeChatSDKDemo
//
//  Created by orvibo on 15/10/26.
//  Copyright © 2015年 orvibo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXApiObject.h"
#import "WXApi.h"

@interface HMWXRequest : NSObject

+ (BOOL)sendAppContentData:(NSData *)data
                   ExtInfo:(NSString *)info
                    ExtURL:(NSString *)url
                     Title:(NSString *)title
               Description:(NSString *)description
                MessageExt:(NSString *)messageExt
             MessageAction:(NSString *)action
                ThumbImage:(UIImage *)thumbImage
                   InScene:(enum WXScene)scene;

+ (BOOL)sendLinkURL:(NSString *)urlString
            TagName:(NSString *)tagName
              Title:(NSString *)title
        Description:(NSString *)description
         ThumbImage:(UIImage *)thumbImage
            InScene:(enum WXScene)scene;

@end
