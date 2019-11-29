//
//  ButtonNode.h
//  小熊避雨
//
//  Created by 郭鹏 on 16/5/13.
//  Copyright © 2016年 郭鹏. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
typedef void (^ButtonBlock)();

@interface ButtonNode : SKSpriteNode

-(id)initWithDefaultTexture:(SKTexture *) defaultTexture andTouchedTexture:(SKTexture *)touchedTexture;
-(void)setMethod:(ButtonBlock)returnMothod;
+(void)ButtonActionBegan:(SKNode *)node touched:(NSSet*)touches withEvent:(UIEvent *)event;
+(void)ButonActionEnd:(SKNode *)node touched:(NSSet *)touched withEvent:(UIEvent *)event;

@end
