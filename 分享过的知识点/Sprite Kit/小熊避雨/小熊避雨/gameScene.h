//
//  gameScene.h
//  小熊避雨
//
//  Created by 郭鹏 on 16/5/17.
//  Copyright © 2016年 郭鹏. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
static const uint32_t rainCategory = 0x1 <<0;
static const uint32_t koalaCategory =0x1 <<1;
static const CGFloat randomFloat(CGFloat Min, CGFloat Max){
    return floor(((rand() % RAND_MAX) / (RAND_MAX * 1.0)) * (Max - Min) + Min);
}

@interface gameScene : SKScene<SKPhysicsContactDelegate>

@end
