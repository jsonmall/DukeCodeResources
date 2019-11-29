//
//  TYHInternalSearchBar.h
//  TaiYangHua
//
//  Created by Lc on 16/1/19.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TYHInternalSearchBar;

@protocol TYHInternalSearchBarDelegate <NSObject>

@required

- (void)searchBarDidBeginEditing:(TYHInternalSearchBar *)searchBar;
- (void)searchBarDidChangeEditing:(TYHInternalSearchBar *)searchBar text:(NSString *)text;

@end


typedef void(^cancelButtonBlock) ();

@interface TYHInternalSearchBar : UIView

+ (instancetype)searchBar;

@property (weak, nonatomic) id<TYHInternalSearchBarDelegate> delegate;

@property (copy, nonatomic) cancelButtonBlock cancelButtonClickBlock;

@end
