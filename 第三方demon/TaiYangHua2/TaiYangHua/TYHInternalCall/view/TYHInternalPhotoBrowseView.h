//
//  TYHInternalPhotoBrowseView.h
//  TaiYangHua
//
//  Created by Lc on 16/3/9.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYHInternalPhotoBrowseView : UIView

@property (assign, nonatomic) NSInteger index;
@property (strong, nonatomic) NSArray *datasource;

- (void)show;

@end
