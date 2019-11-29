//
//  TYHChartTipsCell.h
//  TaiYangHua
//
//  Created by Vieene on 16/1/20.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TYHChartCellFrame;
@interface TYHChartTipsCell : UITableViewCell
@property (nonatomic,strong) TYHChartCellFrame *cellFrame;
extern CGFloat TipsCellcontainerLeft;
extern CGFloat TipsCellcontaineRight;
extern CGFloat TipsCellcontainerTop;
extern CGFloat TipsCellcontainerBottom;

extern CGFloat TipsCellLabelLeft;
extern CGFloat TipsCellLabelRight;
extern CGFloat TipsCellLabelTop;
extern CGFloat TipsCellLabelBottom;
@end
