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

@implementation TYHAudioPlayTool

+(void)playWithMessage:(TYHInternalSession *)internalSession msgLabel:(UILabel *)msgLabel receiver:(BOOL)receiver{
    
    [animatingImageView stopAnimating];
    [animatingImageView removeFromSuperview];
    
    NSString *path = internalSession.recordPath;
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        return;
    }
    
    [[TYHCDDeviceManager sharedInstance] asyncPlayingWithPath:path completion:^(NSError *error) {
        [animatingImageView stopAnimating];
        [animatingImageView removeFromSuperview];
    }];
    
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
    
}
@end
