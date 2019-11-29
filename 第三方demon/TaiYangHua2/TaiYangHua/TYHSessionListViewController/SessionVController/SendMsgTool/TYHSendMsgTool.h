//
//  TYHSendMsgTool.h
//  TaiYangHua
//
//  Created by Vieene on 16/3/17.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "TYHAVAudioRecorder.h"
@class TYHChartCellFrame;
@class TYHDataSource;
@class TYHBaseSessionViewController;
@interface TYHSendMsgTool : NSObject

@property (nonatomic,strong) TYHAVAudioRecorder *recorder;
+ (instancetype)shareSendMsgTools;
/**
 *  发送文本以及表情
 *
 *  @param wds       内容
 *  @param sessionId 会话ID
 */
- (void)sendTextMsgWithWds:(NSString * )wds
                 sessionId:(NSString *)sessionId
                   Success:(void (^)(TYHChartCellFrame *megModel))success
                   failure:(void (^)(NSString *errorStr))failure;
/**
 *  发送图片
 *
 *  @param seesionId 会话ID
 *  @param assets    Asset
 */
- (void)sendImageMsgWithSessionId:(NSString * )seesionId
                         DataSource:(TYHDataSource *)dataSource
                    PickingAssets:(NSArray *)assets
                   Success:(void (^)(TYHChartCellFrame *megModel))success
                   failure:(void (^)(NSString *errorStr))failure;

/**开始录音*/
- (void)beginRecord;
/**结束录音*/
- (void)stopRecord;
/**完成录音*/
- (void)completeRecord;
/**获取录音时间*/
- (NSInteger)getRecoreTime;


@end
