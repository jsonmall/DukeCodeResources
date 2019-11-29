//
//  ViewController.m
//  小熊避雨
//
//  Created by 郭鹏 on 16/5/13.
//  Copyright © 2016年 郭鹏. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "PlayMusic.h"
extern BOOL const IsPlaying;

@interface ViewController ()
@property (nonatomic) AVAudioPlayer *backGroundMusic;

@end

@implementation ViewController
-(void)loadView
{
    self.view=[[SKView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
}
+(ViewController*)shareInstance
{
    static ViewController *shareinstace=nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        shareinstace=[[self alloc]init];
    });
    return shareinstace;
}

-(id)init
{
    
    self=[super init];
    if (self) {
       
    }
    return self;
}
//用strorboard创建的会init调用这个方法
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self=[super initWithCoder:aDecoder];
    if (self) {
     
    }
    return self;
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    SKView *skView=(SKView*)self.view;
    if (!skView.scene) {
       
        //播放歌曲
        [[PlayMusic shareInstance] playBackGorundMusic];
       
        skView.showsFPS=NO;
        skView.showsNodeCount=NO;
        SKScene *scene=[[homeScene alloc]initWithSize:skView.bounds.size];
        [skView presentScene:scene];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
