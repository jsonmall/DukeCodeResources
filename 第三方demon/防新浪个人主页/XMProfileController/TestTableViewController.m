//
//  TestTableViewController.m
//  XMProfileController
//
//  Created by sfk-ios on 2018/4/27.
//  Copyright © 2018年 aiq西米. All rights reserved.
//

#import "TestTableViewController.h"

#warning  !! 继承自sub class of: XMTableViewController
@interface TestTableViewController ()
/// 有多少行cell
@property (assign, nonatomic) int rowNum;
@end

@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [UIView new];
    
    self.rowNum = (arc4random() % 2) *30 +5;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.rowNum;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"TestTableViewController";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID ];
    if (!cell) {
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"indexPath.row==%ld",indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath==%@",self.navigationController);
    if (self.navigationController) {
        UIViewController *vc = [[UIViewController alloc]init];
        vc.view.backgroundColor = [UIColor whiteColor];
        vc.title = [NSString stringWithFormat:@"indexPath.row==%ld",indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
