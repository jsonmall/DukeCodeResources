//
//  ViewController.m
//  FlapFlap
//
//  Created by Nathan Borror on 2/5/14.
//  Copyright (c) 2014 Nathan Borror. All rights reserved.
//

#import "ViewController.h"
#import "NewGameScene.h"
#import "GameScene.h"
@implementation ViewController
{

}
- (void)loadView
{
  self.view  = [[SKView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
}

- (void)viewDidLoad
{
  [super viewDidLoad];

  [self.view setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];

 _SkView = (SKView *)[self view];
  
  [_SkView setShowsFPS:YES];
  [_SkView setShowsNodeCount:YES];

  SKScene *scene = [NewGameScene sceneWithSize:_SkView.bounds.size];
  [scene setScaleMode:SKSceneScaleModeAspectFill];
  [_SkView presentScene:scene];
}





@end
