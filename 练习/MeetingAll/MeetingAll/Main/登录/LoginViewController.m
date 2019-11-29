//
//  LoginViewController.m
//  MeetingAll
//
//  Created by GPsmile on 16/8/18.
//  Copyright © 2016年 gpsmile. All rights reserved.
//

#import "LoginViewController.h"
#import "UIButton+UIButonIMgWithLabel.h"
#import "GPRootViewController.h"
#import <IJKMediaFramework/IJKMediaFramework.h>
@interface LoginViewController ()

@property (nonatomic,strong)IJKFFMoviePlayerController *player;
@property (weak, nonatomic) IBOutlet UIButton *QQLogin;
@property (weak, nonatomic) IBOutlet UIButton *WeiBoLogin;
@property (weak, nonatomic) IBOutlet UIButton *WechatLogin;

@property (weak, nonatomic) IBOutlet UIView *coverView;

@end

@implementation LoginViewController
-(void)loadView
{
    self.view=[[[NSBundle mainBundle] loadNibNamed:@"LoginViewController" owner:self options:nil] firstObject];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.player shutdown];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self.player.view removeFromSuperview];
    self.player = nil;
    
}
-(void)setUpView
{
    [self.QQLogin setImage:[UIImage imageNamed:@"qqloginicon_60x60"] forState:0];
    [self.WeiBoLogin setImage:[UIImage imageNamed:@"wbLoginicon_60x60"]  forState:0];
    [self.WechatLogin setImage:[UIImage imageNamed:@"wxloginicon_60x60"] forState:0];
    [self.coverView bringSubviewToFront:self.view];
    [self initObserver];
}
-(IJKFFMoviePlayerController *)player
{
    if (!_player) {
        // 随机播放一组视频
        NSString *path = arc4random_uniform(10) % 2 ? @"login_video" : @"loginmovie";
        IJKFFMoviePlayerController *player = [[IJKFFMoviePlayerController alloc] initWithContentURLString:[[NSBundle mainBundle] pathForResource:path ofType:@"mp4"] withOptions:[IJKFFOptions optionsByDefault]];
        // 设计player
        player.view.frame = self.view.bounds;
        // 填充fill
        player.scalingMode = IJKMPMovieScalingModeAspectFill;
        [self.view insertSubview:player.view belowSubview:self.coverView];
        // 设置自动播放
        player.shouldAutoplay = NO;
        // 准备播放
        [player prepareToPlay];
        [player play];
        _player = player;
        
    }
    return _player;
}
- (void)initObserver
{
    [self player];
    // 监听视频是否播放完成
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didFinish) name:IJKMPMoviePlayerPlaybackDidFinishNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stateDidChange) name:IJKMPMoviePlayerLoadStateDidChangeNotification object:nil];
}
- (void)stateDidChange
{
    if ((self.player.loadState & IJKMPMovieLoadStatePlaythroughOK) != 0) {
        if (!self.player.isPlaying) {
         
            [self.player play];

        }
    }
}

- (void)didFinish
{
    // 播放完之后, 继续重播
    [self.player play];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
- (IBAction)thirdLogin:(UIButton *)sender {
    
   [self presentViewController:[[GPRootViewController
                                 
                                 alloc]init] animated:NO completion:^{
       
   }];
}

- (IBAction)fastLogin:(UIButton *)sender {
}


@end
