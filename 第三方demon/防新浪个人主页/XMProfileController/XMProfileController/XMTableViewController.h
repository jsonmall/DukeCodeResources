//
//  XMTableViewController.h
//  XMProfileDemo
//
//  Created by sfk-ios on 2018/4/26.
//  Copyright © 2018年 aiq西米. All rights reserved.
//

#import <UIKit/UIKit.h>


#define SHOULD_SCROLL_TO_TOP_NOTI @"SHOULD_SCROLL_TO_TOP_NOTI"

@protocol XMTableViewControllerDelegate <NSObject>

@optional
- (void)tableView:(UITableView *)tableView didScrollOffsetY:(CGFloat)offsetY;

@end

@interface XMTableViewController : UITableViewController
@property (weak, nonatomic) id<XMTableViewControllerDelegate> delegate;
@end
