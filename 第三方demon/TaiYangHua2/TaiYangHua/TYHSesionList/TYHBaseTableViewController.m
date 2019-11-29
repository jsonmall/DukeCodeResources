//
//  TYHBaseTableViewController.m
//  TaiYangHua
//
//  Created by Vieene on 15/12/29.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import "TYHBaseTableViewController.h"

@interface TYHBaseTableViewController ()

@end

@implementation TYHBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *leftBarBtnItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backImage"]
                                                                       style:UIBarButtonItemStyleBordered
                                                                      target:self
                                                                      action:@selector(clickBackBarItem)];
    leftBarBtnItem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftBarBtnItem;
    UIColor * color = [UIColor whiteColor];
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    self.navigationController.navigationBar.titleTextAttributes = dict;

}
- (void)clickBackBarItem
{
    [self.navigationController popViewControllerAnimated:YES];
}





@end
