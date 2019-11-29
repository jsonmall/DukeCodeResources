//
//  NSString+TYHExtension.h
//  TaiYangHua
//
//  Created by Lc on 16/3/21.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TYHExtension)
/**
 *  生成表情 字符串
 *
 */
- (NSAttributedString *)emotionStringWithWH:(CGFloat)WH;

/**
 *  聊天界面 显示的时间cell
 *
 */
- (NSString *)timeString;

/**
 *  重新命名本地录音文件
 *
 */
- (NSString *)renameRecordFileNameWithFileURL:(NSString *)fileURL;

/**
 *  返回录音文件本地路径
 *
 */
+ (NSString *)recordFileNameWithFileURL:(NSString *)fileURL;

/**
 *  返回本地图片
 *
 */
+ (NSString *)iamgeCachesPathWithImageName:(NSString *)imageName;
@end
