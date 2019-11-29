//
//  TYHAudioPlayTool.h
//  TaiYangHua
//
//  Created by Lc on 16/1/25.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TYHInternalSession;

@interface TYHAudioPlayTool : NSObject

/**
 *  播放当前的选中的音频
 *
 *  @param internalSession 模型
 *  @param msgLabel        显示音频的label
 *  @param receiver        是否接受者
 */
+ (void)playWithMessage:(TYHInternalSession *)internalSession msgLabel:(UILabel *)msgLabel receiver:(BOOL)receiver;

+ (void)stop;

+ (void)playingImageView;

+ (void)stopPlayingImageView;
@end
