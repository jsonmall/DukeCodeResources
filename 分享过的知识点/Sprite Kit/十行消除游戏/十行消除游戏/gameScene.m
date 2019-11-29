//
//  gameScene.m
//  十行消除游戏
//
//  Created by 郭鹏 on 16/5/6.
//  Copyright © 2016年 郭鹏. All rights reserved.
//

#import "gameScene.h"
#import "SpaceShipScene.h"
@implementation gameScene
{
    SKLabelNode *helloLable;
}
-(instancetype)initWithSize:(CGSize)size
{
    if (self=[super initWithSize:size])
    {
        self.backgroundColor=[SKColor colorWithRed:.69 green:.84 blue:.97 alpha:1];
        helloLable =[SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        helloLable.text=@"Hello ,World!";
        helloLable.fontSize=42;
        helloLable.name=@"hello";
        helloLable.position=CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        //绘制路径
        SKShapeNode *shape=[self creatShape];
        shape.position=CGPointMake(CGRectGetMidX(self.frame),  CGRectGetMidY(self.frame)+100);
        [self addChild:shape];
        [self addChild:helloLable];
    }
    return self;
}
//每当视图呈现场景时，该方法都会被调用
-(void)didMoveToView:(SKView *)view
{
    
}
-(SKShapeNode*)creatShape
{
    SKShapeNode *shapeNode=[[SKShapeNode alloc]init];
    CGMutablePathRef mypath=CGPathCreateMutable();
    /*
     x:圆心x坐标   y:圆心y坐标
     r:半径       startangle: 圆弧的起点， endangle：圆弧的终点
     bool:是否是顺时针
     
     */
    CGPathAddArc(mypath, NULL, 0.0, 15.0, 60, M_PI, M_PI*4, NO);
    shapeNode.path=mypath;
    shapeNode.lineWidth=1;
    //填充内部的颜色
    shapeNode.fillColor=[SKColor blueColor];
    //绘制的轨迹颜色
    shapeNode.strokeColor=[SKColor whiteColor];
    shapeNode.glowWidth=0.5;
    
    SKAction *sequnce=[SKAction sequence:@[[SKAction scaleXBy:0.5 y:0.5 duration:1.0],[SKAction waitForDuration:1.0],[SKAction scaleXBy:2 y:2 duration:1.0]]];
    [shapeNode runAction:[SKAction repeatActionForever:sequnce]];
    
    
    
    return shapeNode;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch=[touches anyObject];
    SKNode *helloNode=[self nodeAtPoint:[touch locationInNode:self]];
    
    if ([helloNode.name isEqualToString:@"hello"]) {
        helloNode.name=nil;
        SKAction *moveUp=[SKAction moveByX:0 y:100 duration:0.5];
        SKAction *zoom=[SKAction scaleTo:2.0 duration:0.25];
        SKAction *pause=[SKAction waitForDuration:0.5];
        SKAction *fadeAway=[SKAction fadeInWithDuration:0.25];
        SKAction *remove=[SKAction removeFromParent];
        SKAction *moveSequece=[SKAction sequence:@[moveUp,zoom,pause,fadeAway,remove]];
        [helloNode runAction:moveSequece completion:^{
            SKScene *spceshipScene=[[SpaceShipScene alloc]initWithSize:self.size];
            SKTransition *doors=[SKTransition doorsOpenVerticalWithDuration:1];
            [self.view presentScene:spceshipScene transition:doors];
            
        }];
        
    }
    
}
@end










