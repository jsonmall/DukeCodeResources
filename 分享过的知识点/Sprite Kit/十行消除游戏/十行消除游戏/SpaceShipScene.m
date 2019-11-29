//
//  SpaceShipScene.m
//  十行消除游戏
//
//  Created by 郭鹏 on 16/5/11.
//  Copyright © 2016年 郭鹏. All rights reserved.
//

#import "SpaceShipScene.h"
#import "SKNode+SKTDebugDraw.h"


static CGFloat inline skRandf() {
    return rand()/(CGFloat)RAND_MAX;
}

static inline CGFloat skRand(CGFloat low, CGFloat high) {
    return skRandf()*(high - low) + low;
}

static const CGFloat randomFloat(CGFloat Min, CGFloat Max){
    return floor(((rand() % RAND_MAX) / (RAND_MAX * 1.0)) * (Max - Min) + Min);
}
@interface SpaceShipScene()
@property (nonatomic) BOOL contenCreated;

@end
@implementation SpaceShipScene

-(void)didMoveToView:(SKView *)view
{
    if (!self.contenCreated) {
        [self createSceneContets];
        self.contenCreated=YES;
    }
}
-(void)createSceneContets
{
    self.backgroundColor=[SKColor blackColor];
    self.scaleMode=SKSceneScaleModeAspectFit;
    SKSpriteNode *spaceship=[self newSpaceship];
    spaceship.position=CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-150);
    [self addChild:spaceship];
    //生成大量的岩石
    SKAction *makeRocks=[SKAction sequence:@[[SKAction performSelector:@selector(addRock) onTarget:self],[SKAction waitForDuration:0.1 withRange:0.15]]];
    [self runAction:[SKAction repeatActionForever:makeRocks]];
    
}
//创建飞船
-(SKSpriteNode*)newSpaceship
{
    SKSpriteNode *hull=[[SKSpriteNode alloc]initWithColor:[SKColor grayColor] size:CGSizeMake(64, 34)];
    SKAction *hover=[SKAction sequence:@[[SKAction waitForDuration:1.0],[SKAction moveByX:100 y:50 duration:1.0],[SKAction waitForDuration:1.0],[SKAction moveByX:-200 y:0 duration:1.0],[SKAction waitForDuration:1.0],[SKAction moveByX:100 y:-50 duration:1.0]]];
    hull.name=@"hull";
    //[hull runAction:[SKAction repeatActionForever:hover]];
    SKSpriteNode *light1=[self newLight];
    light1.position=CGPointMake(-28, 0);
    
    [hull addChild:light1];
    
    SKSpriteNode *light2=[self newLight];
    light2.position=CGPointMake(28, 0);
    [hull addChild:light2];
    
    SKSpriteNode *light3=[self newLight];
    light3.position=CGPointMake(0, -15);
    
    [hull addChild:light3];
    
    //画一个盒子
    CGFloat offsetX=hull.frame.size.width*hull.anchorPoint.x;
    CGFloat offsetY=hull.frame.size.height*hull.anchorPoint.y;
#if 0
    CGMutablePathRef path=CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL,28, 34);
    CGPathAddLineToPoint(path, NULL, 28,-17);
    CGPathAddLineToPoint(path, NULL, -28, -17);
    CGPathAddLineToPoint(path, NULL, -28, 34);
    CGPathAddLineToPoint(path, NULL, 0, 17);
    CGPathAddLineToPoint(path, NULL, 28, 34);
    [hull skt_attachDebugFrameFromPath:path color:[SKColor redColor]];
    CGPathCloseSubpath(path);
#endif
    hull.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:hull.size];
    hull.physicsBody.dynamic=NO;
    
    
    return hull;
    
}
-(SKSpriteNode*)newLight
{
    SKSpriteNode *light=[[SKSpriteNode alloc]initWithColor:[SKColor yellowColor] size:CGSizeMake(8, 8)];
    SKAction *blink=[SKAction sequence:@[[SKAction fadeOutWithDuration:0.25],[SKAction fadeInWithDuration:0.25]]];
    SKAction *blikForever=[SKAction repeatActionForever:blink];
    [light runAction:blikForever];
    return light;
}
//产生大量的岩石
-(void)addRock
{
    SKSpriteNode *rock=[[SKSpriteNode alloc]initWithColor:[SKColor brownColor] size:CGSizeMake(8, 8)];
    rock.position=CGPointMake(skRand(0, self.size.width), self.size.height);
    rock.name=@"rock";
    rock.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:rock.size];
    //开启精确碰撞检测
    rock.physicsBody.usesPreciseCollisionDetection=YES;
    [self addChild:rock];
    
}
//调用模拟物理效果后的回调方法,当岩石移动到屏幕之外的时移除他们
-(void)didSimulatePhysics
{
    [self enumerateChildNodesWithName:@"rock" usingBlock:^(SKNode * _Nonnull node, BOOL * _Nonnull stop) {
        if (node.position.y<0) {
            [node removeFromParent];
        }
        
    }];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
   
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch=[touches anyObject];
    SKSpriteNode *hullNode=(SKSpriteNode*)[self nodeAtPoint:[touch locationInNode:self]];
    if ([hullNode.name isEqualToString:@"hull"]) {
        hullNode.position=[touch locationInNode:self];
    }
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    
    
}

@end
