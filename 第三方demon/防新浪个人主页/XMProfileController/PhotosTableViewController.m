//
//  PhotosTableViewController.m
//  XMProfileController
//
//  Created by sfk-ios on 2018/4/28.
//  Copyright © 2018年 aiq西米. All rights reserved.
//

#import "PhotosTableViewController.h"
#import "TestCostomTableViewCell.h"

@interface PhotosTableViewController ()

@end

@implementation PhotosTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass(TestCostomTableViewCell.class) bundle:nil] forCellReuseIdentifier:TestCostomTableViewCellID];
    self.tableView.rowHeight = 220;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *cellID = @"PhotosTableViewController";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID ];
//    if (!cell) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
//    }
//    cell.textLabel.text = [NSString stringWithFormat:@"row==%ld",indexPath.row];
//    cell.imageView.image = [UIImage imageNamed:@"girl.jpg"];
    
    TestCostomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TestCostomTableViewCellID forIndexPath:indexPath];
    cell.title = [NSString stringWithFormat:@"row==%ld",indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"photos didSelectRowAtIndexPath==%@",self.navigationController);
    if (self.navigationController) {
        UIViewController *vc = [[UIViewController alloc]init];
        vc.view.backgroundColor = [UIColor whiteColor];
        vc.title = [NSString stringWithFormat:@"row==%ld",indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
