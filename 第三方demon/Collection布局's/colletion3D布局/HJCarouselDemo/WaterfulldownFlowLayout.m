//
//  WaterfulldownFlowLayout.m
//  HJCarouselDemo
//
//  Created by GPsmile on 16/8/16.
//  Copyright © 2016年 olinone. All rights reserved.
//

#import "WaterfulldownFlowLayout.h"

@interface WaterfulldownFlowLayout()
@property (nonatomic,strong)NSMutableArray *heights;
@end
@implementation WaterfulldownFlowLayout
-(void)prepareLayout
{
    [super prepareLayout];
    self.cloWidth=(self.collectionView.frame.size.width-(self.lineNumber+1)*colMargin)/self.lineNumber;
    self.heights=nil;
}
-(CGSize)collectionViewContentSize{
    NSNumber * longest = self.heights[0];
    for (NSInteger i =0;i<self.heights.count;i++) {
        NSNumber* rolHeight = self.heights[i];
        if(longest.floatValue<rolHeight.floatValue){
            longest = rolHeight;
        }
    }
    return CGSizeMake(self.collectionView.frame.size.width, longest.floatValue);
}
//每个cell要出来的都会调用该方法类似于TableView的cellfor,
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{

    UICollectionViewLayoutAttributes * attributes=[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    NSInteger index=indexPath.item%self.lineNumber;
    CGFloat x =(index+1)*colMargin +(index) *self.cloWidth;
    CGFloat y=[self.heights[index] floatValue];
    //获取cell的高度
    CGFloat height= [self.colsHeight[indexPath.item%50] floatValue];
    attributes.frame=CGRectMake(x, y, self.cloWidth, height);
    self.heights[index]=@(height+colMargin+[self.heights[index] floatValue]);

    return attributes;
}
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    [super layoutAttributesForElementsInRect:rect];
    NSMutableArray* array = [NSMutableArray array];
    NSInteger items = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i<items;i++) {
        UICollectionViewLayoutAttributes* attr = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [array addObject:attr];
    }
    return array;
}
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
-(NSMutableArray *)heights
{
    if (!_heights) {
        _heights=[NSMutableArray arrayWithCapacity:self.lineNumber];
        for (NSInteger i=0; i<self.lineNumber; i++) {
            [_heights addObject:@(5)];
        }
    }
    return _heights;
}
@end
