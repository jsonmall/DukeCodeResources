//
//  JMDateScrollView.h
//  TestProductForTableView
//
//  Created by HHLY on 15/12/29.
//  Copyright © 2015年 HHLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMDateScrollView : UITableView
/** 被选择的行数 */
@property (nonatomic, assign) NSInteger seletedIndexRow;
/** 需要显示的数据源 */
@property (nonatomic, strong) NSArray *arrValues;
@property (nonatomic, strong) UIFont *cellFont;
@property (nonatomic, assign) NSTextAlignment textAlignment;

- (instancetype)initWithFrame:(CGRect)frame
                    andValues:(NSArray *)arrayValues
                withTextAlign:(NSTextAlignment)align
                  andTextSize:(CGFloat)txtSize;
// 取消高亮状态
- (void)dehighlightLastCell;
// 设定对应cell的高亮状态
- (void)highlightCellWithIndexPathRow:(NSUInteger)indexPathRow;

@end
