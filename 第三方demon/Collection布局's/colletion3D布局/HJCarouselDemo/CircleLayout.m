//
//  CircleLayout.m
//  HJCarouselDemo
//
//  Created by GPsmile on 16/8/16.
//  Copyright © 2016年 olinone. All rights reserved.
//

#import "CircleLayout.h"

@implementation CircleLayout

-(void)prepareLayout
{
    self.minimumLineSpacing=5;
    self.minimumInteritemSpacing=5;
    
}
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSInteger count=[self.collectionView numberOfItemsInSection:0];
    NSMutableArray *arrm=[NSMutableArray array];
    for (NSInteger i=0; i<count; i++) {
        NSIndexPath *indexpath=[NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attributes=[self layoutAttributesForItemAtIndexPath:indexpath];
        [arrm addObject:attributes];
    }
    return [arrm copy];
}
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger count=[self.collectionView numberOfItemsInSection:0];
    //角度
    CGFloat angle=2*M_PI/count *indexPath.item;
    //圆心的位置
    CGFloat Ox=self.collectionView.frame.size.width/2;
    CGFloat Oy=self.collectionView.frame.size.height/2;
    UICollectionViewLayoutAttributes *attributes=[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.center=CGPointMake(Ox+self.radius*sin(angle), Oy+self.radius*cos(angle));
    attributes.size=CGSizeMake(50, 50);
    return attributes;
}
@end
