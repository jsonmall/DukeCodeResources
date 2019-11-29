//
//  gameScene.m
//  使用SpriteNode2
//
//  Created by 郭鹏 on 16/5/11.
//  Copyright © 2016年 郭鹏. All rights reserved.
//

#import "gameScene.h"
static const CGFloat randomFloat(CGFloat Min, CGFloat Max){
    return floor(((rand() % RAND_MAX) / (RAND_MAX * 1.0)) * (Max - Min) + Min);
}
@interface gameScene()

@end


@implementation gameScene

-(instancetype)initWithSize:(CGSize)size
{
    self=[super initWithSize:size];
    if (self)
   {
     
       self.backgroundColor=[SKColor whiteColor];
       SKAction *makeMoster=[SKAction sequence:@[[SKAction performSelector:@selector(creatMoster) onTarget:self],[SKAction waitForDuration:5.0]]];
       self.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:self.size];
       [self.physicsWorld setContactDelegate:self];
       [self.physicsWorld setGravity:CGVectorMake(0, -9.8)];
       [self runAction:[SKAction repeatActionForever:makeMoster]];
       
    }
    return self;
}
-(SKSpriteNode *)creatMoster
{
    SKSpriteNode *master=[SKSpriteNode spriteNodeWithImageNamed:@"monster"];
    master.position=CGPointMake(randomFloat(20, self.size.width),self.size.height );
    master.name=@"name";
    //混合着色
    master.colorBlendFactor=0;
    master.physicsBody.usesPreciseCollisionDetection=YES;
    master.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:master.size];
    master.physicsBody.dynamic=YES;
    [self addChild:master];
    
    SKAction *pluseRed=[SKAction sequence:@[[SKAction moveByX:-200 y:randomFloat(0, self.size.height) duration:2.0],[SKAction colorizeWithColor:[SKColor redColor] colorBlendFactor:1.0 duration:0.5],[SKAction waitForDuration:1.0]]];
    [master runAction:pluseRed];
    
    return master;
    
}
-(void)didSimulatePhysics
{
    [self enumerateChildNodesWithName:@"master" usingBlock:^(SKNode * _Nonnull node, BOOL * _Nonnull stop) {
        if (node.position.y<0) {
            [node removeFromParent];
        }
        
    }];
}
-(void)didBeginContact:(SKPhysicsContact *)contact
{
    
}




@end
