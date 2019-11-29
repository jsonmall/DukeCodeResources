//
//  TYHRefreshHeader.m
//  TaiYangHua
//
//  Created by Lc on 16/1/14.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "TYHRefreshHeader.h"


@implementation TYHRefreshHeader
- (void)prepare
{
    [super prepare];
    
    
    NSMutableArray *idleImages = [NSMutableArray array];
    UIImage *image = [UIImage imageNamed:@"下拉箭头"];
    [idleImages addObject:image];
    [self setImages:idleImages forState:MJRefreshStateIdle];
    
    NSMutableArray *pullingImages = [NSMutableArray array];
    UIImage *imageP = [UIImage imageNamed:@"向上箭头"];
    [pullingImages addObject:imageP];
    [self setImages:pullingImages forState:MJRefreshStatePulling];
    
    
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 0; i<8; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"刷新-%zd", i + (i * 1)]];
        [refreshingImages addObject:image];
    }
    
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
    
    [self setTitle:Localizable(@"下拉刷新") forState:MJRefreshStateIdle];
    [self setTitle:Localizable(@"松开加载更多") forState:MJRefreshStatePulling];
    [self setTitle:Localizable(@"正在加载...") forState:MJRefreshStateRefreshing];
    
    self.stateLabel.font = [UIFont systemFontOfSize:15];
    self.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:14];
//    self.lastUpdatedTimeLabel.hidden = YES;
    self.stateLabel.textColor = APPGREYCOLOR;
    self.lastUpdatedTimeLabel.textColor = APPGREYCOLOR;
    
}


@end
