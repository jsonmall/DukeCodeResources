//
//  TLCRope.m
//  CutTheVerlet
//
//  Created by Tammy Coron on 4/10/14.
//  Copyright (c) 2014 Tammy Coron. All rights reserved.
//

#import "TLCRope.h"

@interface TLCRope ()
@property (nonatomic,strong)NSString  *name;
@property (nonatomic,strong)NSMutableArray *ropeNodes;
@property (nonatomic,strong)SKNode *attachmentNode;
@property (nonatomic,assign)CGPoint attachmentPoint;
@property (nonatomic,assign)int length;

@end

@implementation TLCRope

#pragma mark -

#pragma mark Init Method
-(instancetype)initWithLength:(int)length usingAttachmentPoint:(CGPoint)point toNode:(SKNode *)node withName:(NSString *)name withDelegate:(id)delegate
{
    self = [super init];
    if (self) {
        self.delegate=delegate;
        self.name=name;
        self.attachmentNode=node;
        self.attachmentPoint=point;
        self.ropeNodes=[NSMutableArray arrayWithCapacity:length];
        self.length=length;
        
    }
    return self;
}

#pragma mark
#pragma mark Setup Physics
-(void)addRopephysics
{
    //记录追踪现在绳子子节点的位置
    CGPoint currentPosition=self.attachmentPoint;
    //加入绳子所有的子部分
    for (int i=0; i<self.length; i++)
    {
        
        SKSpriteNode *ropePart=[SKSpriteNode spriteNodeWithImageNamed:kImageNameForRopeTexture];
        ropePart.name=self.name;
        ropePart.position=currentPosition;
        ropePart.anchorPoint=CGPointMake(0.5, 0.5);
        [self addChild:ropePart];
        [self.ropeNodes addObject:ropePart];
        //加入控制物理特性的代码
        CGFloat offsetX=ropePart.frame.size.width *ropePart.anchorPoint.x;
        CGFloat offsetY=ropePart.frame.size.height *ropePart.anchorPoint.y;
        CGMutablePathRef path=CGPathCreateMutable();
        CGPathMoveToPoint(path,NULL ,0-offsetX ,7-offsetY );
        CGPathAddLineToPoint(path, NULL, 7-offsetX, 7-offsetY);
        CGPathAddLineToPoint(path, NULL, 7-offsetX,0-offsetY );
        CGPathAddLineToPoint(path, NULL, 0-offsetX, 0-offsetY);
        CGPathCloseSubpath(path);
        //使用路径来创建物理实体
        ropePart.physicsBody=[SKPhysicsBody bodyWithPolygonFromPath:path];
        //allowsRotation属性，它决定物体是否能选择，设置为no即冻结旋转。
        ropePart.physicsBody.allowsRotation=YES;
        //，yes即接受重力影响，no则不受重力影响
        ropePart.physicsBody.affectedByGravity=YES;
        //设置碰撞物理属性标识哪些碰撞以及哪些能够碰撞
        ropePart.physicsBody.categoryBitMask=EntityCageGoryRope;
        ropePart.physicsBody.collisionBitMask=EntityCateGoryRopeAttachment;
        ropePart.physicsBody.contactTestBitMask=EntityCategoryPrize;
        //在该节点上绘制一个可以触摸的路径
        [ropePart skt_attachDebugFrameFromPath:path color:[SKColor redColor]];
        CGPathRelease(path);
        //设置下一个子绳子的部分
        currentPosition=CGPointMake(currentPosition.x, currentPosition.y-ropePart.size.height);
        
    }
    [self addropeJoints];
}

#pragma mark -物理联合
/*
 这些方法通过 SKPhysicsJoint类连接了所有的绳子部分。这个类能使两个连接好的实体能独自以锚点为中心旋转，这使游戏中的绳子和真的绳子一样。
 */
-(void)addropeJoints
{
    //给初始化的绑定点设置关节
    SKNode *nodeA=self.attachmentNode;
    SKSpriteNode *nodeB=[self.ropeNodes objectAtIndex:0];
    //有两个物理节点创建一个新的物理联合，bodyA：联合的第一个物体，bodyB:联合的第二个物理， anchor:联合的锚点
    SKPhysicsJointPin *joint=[SKPhysicsJointPin jointWithBodyA:nodeA.physicsBody bodyB:nodeB.physicsBody anchor:self.attachmentPoint];
    //节点旋转是否在限定范围内，让关节僵硬化
    joint.shouldEnableLimits=YES;
    //允许衔接的最大角度
    joint.upperAngleLimit=0;
    //允许衔接最小角度
    joint.lowerAngleLimit=0;
    
    [self.delegate addJoint:joint];
    //为剩下的绳子子节点设置节点
    for (int i=1; i<self.length; i++) {
        SKSpriteNode *nodeA=[self.ropeNodes objectAtIndex:i-1];
        SKSpriteNode *nodeB=[self.ropeNodes objectAtIndex:i];
        SKPhysicsJointPin *joint=[SKPhysicsJointPin jointWithBodyA:nodeA.physicsBody bodyB:nodeB.physicsBody anchor:CGPointMake(CGRectGetMidX(nodeA.frame),CGRectGetMinY(nodeA.frame) )];
        //让关节自由转动
        joint.shouldEnableLimits=NO;
        joint.upperAngleLimit=0;
        joint.lowerAngleLimit=0;
        
        [self.delegate addJoint:joint];
    }
    
    
}


#pragma mark Helper Methods
-(NSUInteger )getRopeLength
{
    return self.ropeNodes.count;
}
-(NSMutableArray *)getRopeNodes
{
    
    return self.ropeNodes;
}
@end
