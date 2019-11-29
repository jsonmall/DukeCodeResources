//
//  PlayMusic.m
//  小熊避雨
//
//  Created by 郭鹏 on 16/5/18.
//  Copyright © 2016年 郭鹏. All rights reserved.
//

#import "PlayMusic.h"

@implementation PlayMusic
{
    AVAudioPlayer *backgroundMusic;
    BOOL isPlay;
}
+(PlayMusic*)shareInstance
{
    static PlayMusic  *sharestance=nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharestance=[[PlayMusic alloc]init];
        
    });
    return sharestance;
}
-(void)playBackGorundMusic
{
    NSError *error;
    NSURL *backgorundUrl=[[NSBundle mainBundle]URLForResource:@"bgm" withExtension:@"m4a"];
    backgroundMusic=[[AVAudioPlayer alloc]initWithContentsOfURL:backgorundUrl error:&error];
    backgroundMusic.numberOfLoops=-1;
    [backgroundMusic prepareToPlay];
    isPlay=YES;
    if (isPlay) {
        [backgroundMusic play];
    }
}
-(void)switchMusic
{
    if (isPlay) {
        [backgroundMusic stop];
        isPlay=NO;
    }
    else
    {
        [backgroundMusic play];
        isPlay=YES;
    }
}

@end
