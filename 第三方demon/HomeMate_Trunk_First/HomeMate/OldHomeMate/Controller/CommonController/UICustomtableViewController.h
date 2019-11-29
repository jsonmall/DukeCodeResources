//
//  UICustomtableViewController.h
//  CloudPlatform
//
//  Created by orvibo on 15/5/8.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "CommonNaviController.h"

@interface UICustomtableViewController : CommonNaviController
{
    UITableView         *_tableView;
    NSInteger           _rowNum;
    NSMutableArray      *_titleArr;
    NSMutableArray      *_subTitleArr;
    NSMutableArray      *_imageArr;
    CGFloat              _rowHeight;
    CGFloat              _fontOfSize;
}
@end
