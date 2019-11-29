//
//  TYHAudioPlayerUtil.m
//  TaiYangHua
//
//  Created by Lc on 16/1/25.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "TYHAudioPlayerUtil.h"
#import <AVFoundation/AVFoundation.h>

static TYHAudioPlayerUtil *audioPlayerUtil = nil;

@interface TYHAudioPlayerUtil () <AVAudioPlayerDelegate>{
    AVAudioPlayer *_player;
    void (^playFinish)(NSError *error);
}

@end

@implementation TYHAudioPlayerUtil
#pragma mark - public
+ (BOOL)isPlaying{
    return [[TYHAudioPlayerUtil sharedInstance] isPlaying];
}

+ (NSString *)playingFilePath{
    return [[TYHAudioPlayerUtil sharedInstance] playingFilePath];
}

+ (void)asyncPlayingWithPath:(NSString *)aFilePath
                  completion:(void(^)(NSError *error))completon{
    [[TYHAudioPlayerUtil sharedInstance] asyncPlayingWithPath:aFilePath
                                                  completion:completon];
}

+ (void)stopCurrentPlaying{
    [[TYHAudioPlayerUtil sharedInstance] stopCurrentPlaying];
}


#pragma mark - private
+ (TYHAudioPlayerUtil *)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        audioPlayerUtil = [[self alloc] init];
    });
    
    return audioPlayerUtil;
}

// 当前是否正在播放
- (BOOL)isPlaying
{
    DLog(@"%zd", !!_player);
    return !!_player;
}

// 得到当前播放音频路径
- (NSString *)playingFilePath
{
    NSString *path = nil;
    if (_player && _player.isPlaying) {
        path = _player.url.path;
    }
    
    return path;
}

- (void)asyncPlayingWithPath:(NSString *)aFilePath
                  completion:(void(^)(NSError *error))completon{
    playFinish = completon;
    NSError *error = nil;
    NSFileManager *fm = [NSFileManager defaultManager];
    if (![fm fileExistsAtPath:aFilePath]) {
        error = [NSError errorWithDomain:NSLocalizedString(@"error.notFound", @"File path not exist")
                                    code:100
                                userInfo:nil];
        if (playFinish) {
            playFinish(error);
        }
        playFinish = nil;
        
        return;
    }
    
    NSURL *mp3Url = [[NSURL alloc] initFileURLWithPath:aFilePath];
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:mp3Url error:&error];
    if (error || !_player) {
        _player = nil;
        error = [NSError errorWithDomain:NSLocalizedString(@"error.initPlayerFail", @"Failed to initialize AVAudioPlayer")
                                    code:110
                                userInfo:nil];
        if (playFinish) {
            playFinish(error);
        }
        playFinish = nil;
        return;
    }
    
    _player.delegate = self;
    [_player prepareToPlay];
    [_player play];
}

// 停止当前播放
- (void)stopCurrentPlaying{
    if(_player){
        _player.delegate = nil;
        [_player stop];
        _player = nil;
    }
    if (playFinish) {
        playFinish = nil;
    }
}

- (void)dealloc{
    if (_player) {
        _player.delegate = nil;
        [_player stop];
        _player = nil;
    }
    playFinish = nil;
}

#pragma mark - AVAudioPlayerDelegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player
                       successfully:(BOOL)flag{
    if (playFinish) {
        playFinish(nil);
    }
    if (_player) {
        _player.delegate = nil;
        _player = nil;
    }
    playFinish = nil;
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player
                                 error:(NSError *)error{
    if (playFinish) {
        NSError *error = [NSError errorWithDomain:NSLocalizedString(@"error.palyFail", @"Play failure")
                                             code:100
                                         userInfo:nil];
        playFinish(error);
    }
    if (_player) {
        _player.delegate = nil;
        _player = nil;
    }
}
@end
