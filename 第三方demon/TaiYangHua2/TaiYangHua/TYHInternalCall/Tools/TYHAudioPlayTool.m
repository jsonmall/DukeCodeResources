//
//  TYHAudioPlayTool.m
//  TaiYangHua
//
//  Created by Lc on 16/1/25.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "TYHAudioPlayTool.h"
#import "TYHInternalSession.h"
#import "TYHCDDeviceManager.h"

static UIImageView *animatingImageView;
static TYHInternalSession *lastSession;
@implementation TYHAudioPlayTool

+ (void)playWithMessage:(TYHInternalSession *)internalSession msgLabel:(UILabel *)msgLabel receiver:(BOOL)receiver{
    
    // 停止当前播放中的语音
    if ([[TYHCDDeviceManager sharedInstance] isPlaying] && internalSession == lastSession) {
        [self stop];
        DLog(@"stop");
        return;
    }
    // 移除之前播放的动画
    [animatingImageView stopAnimating];
    [animatingImageView removeFromSuperview];
    
    NSString *path = internalSession.recordPath;
    lastSession = internalSession;
    DLog(@"%@", path);
    // 文件不存在不播放
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) return;
    [[TYHCDDeviceManager sharedInstance] asyncPlayingWithPath:path completion:^(NSError *error) {
        [animatingImageView stopAnimating];
        [animatingImageView removeFromSuperview];
        internalSession.voicePlaying = NO;
    }];
    
    // 播放动画
    UIImageView *imgView = [[UIImageView alloc] init];
    [msgLabel addSubview:imgView];
    
    if (receiver) {
        imgView.animationImages = @[[UIImage imageNamed:@"ReceiverVoiceNodePlaying000_ios7"],
                                    [UIImage imageNamed:@"ReceiverVoiceNodePlaying001_ios7"],
                                    [UIImage imageNamed:@"ReceiverVoiceNodePlaying002_ios7"],
                                    [UIImage imageNamed:@"ReceiverVoiceNodePlaying003_ios7"]];
        imgView.frame = CGRectMake(0, 0, 25, 25);
    }else{
        imgView.animationImages = @[[UIImage imageNamed:@"SenderVoiceNodePlaying000_ios7"],
                                    [UIImage imageNamed:@"SenderVoiceNodePlaying001_ios7"],
                                    [UIImage imageNamed:@"SenderVoiceNodePlaying002_ios7"],
                                    [UIImage imageNamed:@"SenderVoiceNodePlaying003_ios7"]];
        
        imgView.frame = CGRectMake(msgLabel.bounds.size.width - 25, 0, 25, 25);
    }
    
    imgView.animationDuration = 1;
    [imgView startAnimating];
    animatingImageView = imgView;
    internalSession.voicePlaying = YES;
}

+ (void)stop
{
    [[TYHCDDeviceManager sharedInstance] stopPlaying];
    [animatingImageView stopAnimating];
    [animatingImageView removeFromSuperview];
    lastSession.voicePlaying = NO;
}

+ (void)playingImageView
{
    [animatingImageView startAnimating];
}

+ (void)stopPlayingImageView
{
    [animatingImageView stopAnimating];
}
@end
