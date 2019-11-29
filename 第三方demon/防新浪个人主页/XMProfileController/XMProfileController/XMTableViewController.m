//
//  XMTableViewController.m
//  XMProfileDemo
//
//  Created by sfk-ios on 2018/4/26.
//  Copyright © 2018年 aiq西米. All rights reserved.
//

#import "XMTableViewController.h"

@interface XMTableViewController ()<UIGestureRecognizerDelegate>

@end

@implementation XMTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 主要控制器头部出现后，各个子控制器的内容应该滚动到头部
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shouldScrollToTopNotification) name:SHOULD_SCROLL_TO_TOP_NOTI object:nil];
    self.tableView.panGestureRecognizer.cancelsTouchesInView = NO;
}

/// 收到通知，内容滚动到顶部
- (void)shouldScrollToTopNotification
{
    [self.tableView setContentOffset:CGPointZero];
}


#pragma mark - Table view data source
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"XMTableViewControllerCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID ];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"==%ld",indexPath.row];
    
    return cell;
}
 */

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectCellAtIndexPath:)];
    tap.delegate = self;
    tap.numberOfTouchesRequired = 1;
    [cell addGestureRecognizer:tap];
}

- (void)selectCellAtIndexPath:(UITapGestureRecognizer *)recongnizer{
    
    if ([self.tableView.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        
        UITableViewCell *cell = (UITableViewCell *)recongnizer.view;
        //    NSLog(@"nrecongnizer.view==%@",recongnizer.view);
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        //    NSLog(@"nothing indexPath.row==%ld",indexPath.row);
        [self tableView:self.tableView didSelectRowAtIndexPath:indexPath];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([self.delegate respondsToSelector:@selector(tableView:didScrollOffsetY:)]) {
        [self.delegate tableView:self.tableView didScrollOffsetY:scrollView.contentOffset.y];
    }
}


@end
