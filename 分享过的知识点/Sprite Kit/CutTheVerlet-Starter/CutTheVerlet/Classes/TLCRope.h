//
//  TLCRope.h
//  CutTheVerlet
//
//  Created by Tammy Coron on 4/10/14.
//  Copyright (c) 2014 Tammy Coron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
@protocol TLCRopeDelegate
/*
 SKPhysicsJointPin:
 一个别针联合允许两个物体围绕一个锚点独立的旋转，就像是钉在一起。你可以配置两个物体旋转多远以及旋转阻力。
 */
-(void)addJoint:(SKPhysicsJointPin *)joint;

@end
@interface TLCRope : SKNode

@property (nonatomic,strong)id delegate;
-(instancetype)initWithLength:(int)length usingAttachmentPoint:(CGPoint)point toNode:(SKNode*)node withName:(NSString *)name withDelegate:(id)delegate;
-(void)addRopephysics;
-(NSUInteger)getRopeLength;
-(NSMutableArray *)getRopeNodes;


@end
