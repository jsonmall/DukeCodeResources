//
//  PlayerNode.h
//  小熊避雨
//
//  Created by 郭鹏 on 16/5/17.
//  Copyright © 2016年 郭鹏. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface PlayerNode : SKSpriteNode
@property (nonatomic) BOOL islive;
-(id)initWithDefaultTexture:(SKTexture*)defaultTexture andAnimateTextures:(NSArray *)animateTextures;
-(CGPoint)position;
-(void)setPhysicsBodyCategoryMast:(uint32_t) playerCateGory andContactMask:(uint32_t)targetCategory;
-(void)update:(CFTimeInterval)currentTime;
-(void)ended;
-(void)setEndAsdTionTexture:(SKTexture*)endAddtionTexture withEndTexture:(SKTexture*)endTexture;
@end
