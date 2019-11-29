//
//  ViewController.m
//  使用SpriteNode2
//
//  Created by 郭鹏 on 16/5/11.
//  Copyright © 2016年 郭鹏. All rights reserved.
//

#import "ViewController.h"
#import <SpriteKit/SpriteKit.h>
#import "gameScene.h"
@interface ViewController ()

@end

@implementation ViewController

-(void)loadView
{
    self.view =[[SKView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    SKView *skview=(SKView*)self.view;
    skview.showsFPS=YES;
    skview.showsNodeCount=YES;
    
    SKScene *scene=[[gameScene alloc]initWithSize:self.view.frame.size];
    
    [skview presentScene:scene];
}
-(BOOL)shouldAutorotate
{
    return NO;
}
//强制横屏
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscapeRight;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
