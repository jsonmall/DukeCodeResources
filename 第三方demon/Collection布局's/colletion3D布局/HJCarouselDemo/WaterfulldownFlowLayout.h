//
//  WaterfulldownFlowLayout.h
//  HJCarouselDemo
//
//  Created by GPsmile on 16/8/16.
//  Copyright © 2016年 olinone. All rights reserved.
//

#import "SuspensionFlowLayout.h"
#import "HJCarouselViewLayout.h"
#define colMargin 5
#define colCount 4
#define rolMargin 5
@interface WaterfulldownFlowLayout : UICollectionViewFlowLayout
//数组存放每列的总高度
@property (nonatomic,strong)NSMutableArray *colsHeight;
@property (nonatomic,assign)CGFloat cloWidth;
@property (nonatomic,copy)CGFloat (^HeightBlock)(NSIndexPath *indexpath);
/** 列数 */
 @property (nonatomic, assign) NSInteger lineNumber;
 /** 行间距 */
 @property (nonatomic, assign) CGFloat rowSpacing;
 /** 列间距 */
 @property (nonatomic, assign) CGFloat lineSpacing;
 /** 内边距 */
 @property (nonatomic, assign) UIEdgeInsets sectionInset;
/**
   *  计算各个item高度方法 必须实现
   *
  *  @param block 设计计算item高度的block
  */
- (void)computeIndexCellHeightWithWidthBlock:(CGFloat(^)(NSIndexPath *indexPath , CGFloat width))block;

@end
