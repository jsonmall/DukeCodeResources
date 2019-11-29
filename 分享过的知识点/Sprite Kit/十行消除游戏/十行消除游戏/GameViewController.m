//
//  GameViewController.m
//  十行消除游戏
//
//  Created by 郭鹏 on 16/5/5.
//  Copyright (c) 2016年 郭鹏. All rights reserved.
//

#import "GameViewController.h"
#import "gameScene.h"
@implementation GameViewController
{
    SKView *skView;
    
}
-(void)loadView
{
    self.view=[[SKView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    skView =(SKView*)self.view;
    
    skView.showsNodeCount=YES;
    skView.ignoresSiblingOrder=YES;
    skView.showsFPS=YES;
    SKScene *scene=[[gameScene alloc]initWithSize:skView.bounds.size];
    scene.scaleMode=SKSceneScaleModeAspectFill;

    [skView presentScene:scene];
    
}

//- (void) handleTap:(UIGestureRecognizer*)gestureRecognize
//{
//    // retrieve the SCNView
//    SCNView *scnView = (SCNView *)self.view;
//    
//    // check what nodes are tapped
//    CGPoint p = [gestureRecognize locationInView:scnView];
//    NSArray *hitResults = [scnView hitTest:p options:nil];
//    
//    // check that we clicked on at least one object
//    if([hitResults count] > 0){
//        // retrieved the first clicked object
//        SCNHitTestResult *result = [hitResults objectAtIndex:0];
//        
//        // get its material
//        SCNMaterial *material = result.node.geometry.firstMaterial;
//        
//        // highlight it
//        [SCNTransaction begin];
//        [SCNTransaction setAnimationDuration:0.5];
//        
//        // on completion - unhighlight
//        [SCNTransaction setCompletionBlock:^{
//            [SCNTransaction begin];
//            [SCNTransaction setAnimationDuration:0.5];
//            
//            material.emission.contents = [UIColor blackColor];
//            
//            [SCNTransaction commit];
//        }];
//        
//        material.emission.contents = [UIColor redColor];
//        
//        [SCNTransaction commit];
//    }
//}

//- (BOOL)shouldAutorotate
//{
//    return YES;
//}
//
//- (BOOL)prefersStatusBarHidden {
//    return YES;
//}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
