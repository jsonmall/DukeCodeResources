//
//  ButtonNode.m
//  小熊避雨
//
//  Created by 郭鹏 on 16/5/13.
//  Copyright © 2016年 郭鹏. All rights reserved.
//

#import "ButtonNode.h"

@interface ButtonNode()


@end
@implementation ButtonNode
{
    SKTexture *_defaultTexture;
    SKTexture *_touchedTexture;
    SKSpriteNode *_button;
    ButtonBlock _returnMethod;
}
@synthesize size =_size;

+(void)ButtonActionBegan:(SKNode *)node touched:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (![ButtonNode isButtonPressed:[node children]]) {
        UITouch *touch=[touches anyObject];
        CGPoint location=[touch locationInNode:node];
        SKNode *targetNode=[node nodeAtPoint:location];
        if ([node isEqualToNode:targetNode.parent]) {
            [targetNode touchesBegan:touches withEvent:event];
        }
        else
        {
            [targetNode.parent touchesBegan:touches withEvent:event];
        }
    }
    
}
+(void)ButonActionEnd:(SKNode *)node touched:(NSSet *)touched withEvent:(UIEvent *)event
{
    UITouch *touch=[touched anyObject];
    CGPoint location=[touch locationInNode:node];
    SKNode *targetNode=[node nodeAtPoint:location];
    if ([node isEqualToNode:targetNode.parent]) {
        [targetNode touchesEnded:touched withEvent:event];
    }
    else
    {
        [targetNode.parent touchesEnded:touched withEvent:event];
    }
    [ButtonNode removeButtonPressed:[node children]];
}
+(void)removeButtonPressed:(NSArray *)nodes
{
    for (SKNode *node in nodes) {
        if ([node isEqualToNode:[self class]]) {
            ButtonNode *button=(ButtonNode*)node;
            [button didActionDefault];
        }
    }
}
-(void)didActionDefault
{
    [_button removeActionForKey:@"button-touched"];
}
+(BOOL)isButtonPressed:(NSArray *)nodes
{
    BOOL pressed=NO;
    for (SKNode *node in nodes)
    {
        if ([node isKindOfClass:[self class]]) {
            ButtonNode *button=(ButtonNode*)node;
            if ([button actionForKey:@"button-touched"]) {
                pressed=YES;
            }
        }
    }
    return pressed;
}

-(id)initWithDefaultTexture:(SKTexture *)defaultTexture andTouchedTexture:(SKTexture *)touchedTexture
{
    self=[super init];
    if (self) {
        _returnMethod=^{};
        _defaultTexture=defaultTexture;
        _touchedTexture=touchedTexture;
        _button=[SKSpriteNode spriteNodeWithTexture:_defaultTexture];
        [_button runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:@[_defaultTexture] timePerFrame:10.0f resize:YES restore:YES]] withKey:@"button_default"];
        [self addChild:_button];
        _size=_button.size;
    }
    return self;
    
}
-(void)setMethod:(ButtonBlock)returnMothod
{
    _returnMethod=returnMothod;
}
-(void)runMethod
{
    _returnMethod();
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self runAction:[SKAction playSoundFileNamed:@"button-in.m4a" waitForCompletion:NO]];
    [self didActionTouched];
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    if ([self actionForKey:@"button-touched"]) {
        [self runAction:[SKAction playSoundFileNamed:@"button-out.m4a" waitForCompletion:NO]];
        [self runMethod];
    
    [_button removeActionForKey:@"button-touched"];
}
-(void)didActionTouched
{
    if ([_button actionForKey:@"button-touched"]) {
        [_button removeActionForKey:@"button-touched"];
    }
    [_button runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:@[_touchedTexture] timePerFrame:10.0f resize:YES restore:YES]] withKey:@"button-touched"];
    
}
@end
