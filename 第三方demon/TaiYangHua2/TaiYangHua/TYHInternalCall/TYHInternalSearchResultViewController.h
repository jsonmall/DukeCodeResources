//
//  TYHInternalSearchResultViewController.h
//  TaiYangHua
//
//  Created by Lc on 16/1/20.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^resultBlock) (NSDictionary *);

extern NSString const *kResultOfContactKey;
extern NSString const *kResultOfGroupKey;

@interface TYHInternalSearchResultViewController : UITableViewController

@property (copy, nonatomic) resultBlock searchBarResultDictionary;

@end
