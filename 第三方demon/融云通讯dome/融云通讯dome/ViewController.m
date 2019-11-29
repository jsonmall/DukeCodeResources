//
//  ViewController.m
//  融云通讯dome
//
//  Created by 郭鹏 on 16/4/22.
//  Copyright © 2016年 郭鹏. All rights reserved.
//

#import "ViewController.h"
#import <RongIMKit/RongIMKit.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btwone=[UIButton buttonWithType:UIButtonTypeCustom];
    btwone.frame=CGRectMake(20, 80, 60, 30);
    [btwone setTitle:@"单聊" forState:0];
    [btwone setTitleColor:[UIColor redColor] forState:0];
    [btwone addTarget:self action:@selector(chatWithOne) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btwone];
    UIBarButtonItem *itm=[[UIBarButtonItem alloc]initWithCustomView:btwone];
    self.navigationItem.rightBarButtonItem=itm;
    
    
    
}
-(void)chatWithOne
{
    RCConversationViewController *chat=[[RCConversationViewController alloc]initWithConversationType:ConversationType_PRIVATE targetId:@"testone"];
    chat.title = @"talk something";
    [self.navigationController pushViewController:chat animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
