//
//  LineChartView.h
//  ChartView
//
//  Created by duoying on 16/4/22.
//  Copyright © 2016年 duoying. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LineChartView : UIView
@property (nonatomic,strong) NSMutableArray      *dateArray;
@property (nonatomic,strong) NSMutableArray      *dateDetailArray;
@property (nonatomic,strong) NSMutableDictionary *dataDictionary;
@property (nonatomic,strong) NSMutableDictionary *data1Dictionary;
@end
