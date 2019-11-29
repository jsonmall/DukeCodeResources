//
//  TYHAVAudioRecorder.h
//  TaiYangHua
//
//  Created by Vieene on 16/3/17.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
@class TYHDataSource;
@interface TYHAVAudioRecorder : NSObject
/**
 *  生成的文件名字
 */
@property (nonatomic,copy) NSString *fileName;
/**
 *  录音时间
 */
@property (nonatomic,assign) NSInteger recoreTime;

- (void)beginRecord;

- (void)stop;
- (float)updateMeters;
/**
 *  完成录音的操作
 *
 */
- (void)completeRecore;


@end
