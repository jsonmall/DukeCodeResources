//
//  homeScene.m
//  小熊避雨
//
//  Created by 郭鹏 on 16/5/13.
//  Copyright © 2016年 郭鹏. All rights reserved.
//

#import "homeScene.h"
#import "ButtonNode.h"
#import "ViewController.h"
#import "gameScene.h"
#import "PlayMusic.h"
@implementation homeScene



-(instancetype)initWithSize:(CGSize)size
{
    self=[super initWithSize:size];
    if (self) {
        self.backgroundColor=[SKColor colorWithRed:0.1 green:1.0 blue:1.0 alpha:1.0];
        SKTextureAtlas *atlas=[SKTextureAtlas atlasNamed:@"sprite"];
        SKSpriteNode *backgound=[SKSpriteNode spriteNodeWithTexture:[atlas textureNamed:@"background"]];
        backgound.position=CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:backgound];
        
        ButtonNode *Startbutton=[[ButtonNode alloc]initWithDefaultTexture:[atlas textureNamed:@"button-start-off"] andTouchedTexture:[atlas textureNamed:@"button-start-on"]];
        Startbutton.position=CGPointMake(self.size.width/2, self.size.height/2);
        [Startbutton setMethod:^{
            gameScene *game=[[gameScene alloc]initWithSize:self.size];
            
            [self.view presentScene:game];
            
        }];
        ButtonNode *musicBtn=[[ButtonNode alloc]initWithDefaultTexture:[atlas textureNamed:@"button-music-off"] andTouchedTexture:[atlas textureNamed:@"button-music-on"]];
        musicBtn.position=CGPointMake(self.size.width/2, self.size.height/2-80);
        [musicBtn setMethod:^{
            [[PlayMusic shareInstance] switchMusic];
           
        }];
        [self addChild:musicBtn];
        [self addChild:Startbutton];
        
        
        
        
        
        
        
    }
    return self;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [ButtonNode ButtonActionBegan:self touched:touches withEvent:event];
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [ButtonNode ButonActionEnd:self touched:touches withEvent:event];
}


@end
