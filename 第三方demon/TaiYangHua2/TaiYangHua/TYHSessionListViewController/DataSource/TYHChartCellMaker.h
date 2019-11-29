//
//  TYHChartCellMaker.h
//  TaiYangHua
//
//  Created by Vieene on 16/1/22.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TYHSessionTimestampCell;
@class TYHChartTipsCell;
@class TYHTimestampModel;
@class TYHChartCellFrame;
@interface TYHChartCellMaker : NSObject


+ (UITableViewCell *)cellInTable:(UITableView*)tableView
            forMessageMode:(TYHChartCellFrame *)model;

+ (TYHSessionTimestampCell *)cellInTable:(UITableView *)tableView
                            forTimeModel:(TYHTimestampModel *)model;

@end
