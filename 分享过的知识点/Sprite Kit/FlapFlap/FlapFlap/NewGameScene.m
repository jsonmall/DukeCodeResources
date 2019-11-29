//
//  NewGameScene.m
//  FlapFlap
//
//  Created by Nathan Borror on 2/9/14.
//  Copyright (c) 2014 Nathan Borror. All rights reserved.
//

#import "NewGameScene.h"
#import "GameScene.h"

@implementation NewGameScene {
  SKSpriteNode *_button;
    SKLabelNode *GrandeNode;
    
}

- (id)initWithSize:(CGSize)size
{
  if (self = [super initWithSize:size]) {
    [self setBackgroundColor:[SKColor colorWithRed:.61 green:.74 blue:.86 alpha:1]];
    
      [self newHolloNode];
      
  }
  return self;
}
-(void)newHolloNode
{
//    SKLabelNode *HelloNode=[SKLabelNode labelNodeWithText:@"开始游戏"];
//    HelloNode.fontName=@"Chalkduster";
//    HelloNode.fontSize=24;
//    HelloNode.fontColor=[SKColor yellowColor];
//    HelloNode.position=CGPointMake(self.size.width/2, self.size.height/2+50);
//    [self addChild:HelloNode];
    NSArray *facility=@[@"简单",@"一般",@"较难"];
    for (int i=0; i<3; i++) {
        GrandeNode=[SKLabelNode labelNodeWithText:facility[i]];
        GrandeNode.fontName=@"Chalkduster";
        GrandeNode.fontSize=24;
        GrandeNode.fontColor=[SKColor yellowColor];
        GrandeNode.position=CGPointMake(self.size.width/2, self.size.height/2+50-80*i);
        GrandeNode.color=[SKColor whiteColor];
        GrandeNode.name=facility[i];
        NSLog(@"GrandeNode:%f:%lf:%d",GrandeNode.position.x,GrandeNode.position.y,i);
        [self addChild:GrandeNode];
    }
    
    
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  CGFloat  nanyiDu = 0.0;
    UITouch *touch=[touches anyObject];
    CGPoint positionInScence=[touch locationInNode:self];
    SKSpriteNode *touchedNode=(SKSpriteNode *)[self nodeAtPoint:positionInScence];
    if ([[touchedNode name] isEqualToString:@"简单"]) {
        nanyiDu=120;
    }
    else if ([[touchedNode name] isEqualToString:@"一般"])
    {
        nanyiDu=80;
    }
    else if ([[touchedNode name] isEqualToString:@"较难"])
    {
        nanyiDu=60;
    }

    SKTransition *transition = [SKTransition  crossFadeWithDuration:2];
  GameScene *game = [[GameScene alloc] initWithSize:self.size];
    game.kPipeGap=nanyiDu;
  [self.scene.view presentScene:game transition:transition];

//    SKNode *helloNode=[self childNodeWithName:@"HelloNode"];
//    SKLabelNode *helloNode=[SKLabelNode labelNodeWithText:@"结束游戏"];
//    helloNode.fontName=@"Chalkduster";
//    helloNode.fontSize=24;
//    helloNode.fontColor=[SKColor yellowColor];
//    helloNode.position=CGPointMake(self.size.width/2, self.size.height/2+100);
//        helloNode.name=nil;
//        SKAction *moveUp=[SKAction moveByX:0 y:100 duration:1.0];
//        SKAction *zoom=[SKAction scaleTo:2 duration:0.25];
//        SKAction *pause=[SKAction waitForDuration:0.5];
//        SKAction *fadeAway=[SKAction fadeOutWithDuration:0.25];
//        SKAction *remove=[SKAction removeFromParent];
//        SKAction *moveSequence=[SKAction sequence:@[moveUp,zoom,pause,fadeAway,remove]];
//        [helloNode runAction:moveSequence];
//        [self addChild:helloNode];
    
    
    
}
-(BOOL)InRect:(CGPoint)nodeLocation
{
    CGFloat nodeWidth=GrandeNode.frame.size.width /GrandeNode.xScale;
    CGFloat nodeHeigth=GrandeNode.frame.size.height /GrandeNode.yScale;
    NSLog(@"%lf,%lf",nodeWidth,nodeHeigth);
    if (nodeLocation.x>nodeWidth/2 || nodeLocation.y >nodeHeigth/2||nodeLocation.x<-nodeWidth/2||nodeLocation.y<-nodeHeigth/2) {
        return NO;
    }
    else{
        return YES;
    }
}


@end















