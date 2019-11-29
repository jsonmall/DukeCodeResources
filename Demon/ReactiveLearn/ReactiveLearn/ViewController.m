//
//  ViewController.m
//  ReactiveLearn
//
//  Created by GPsmile on 16/10/8.
//  Copyright © 2016年 gpsmile. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"
#import "PresentTransition.h"
#import "ThreeViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIViewControllerTransitioningDelegate>
{
    NSArray *titleArrm;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.transitioningDelegate = self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    titleArrm = @[@"链式编程学习",@"reactiveCocoa",@"RACSingal"];
    UIRefreshControl  * control =[[UIRefreshControl alloc]init];
    [control addTarget:self action:@selector(loadNewTopic:) forControlEvents:UIControlEventValueChanged];
    [self.tableView  addSubview:control];
    self.tableView.delegate = self;
    self.tableView.dataSource= self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}
- (void)loadNewTopic:(UIRefreshControl *)refresh
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      [refresh endRefreshing];
    });
   
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return titleArrm.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = titleArrm[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {

            break;
        }
        case 1:
        {   TwoViewController *twoVC =[[TwoViewController alloc]init];
            twoVC.transitioningDelegate = self;
            //设置代理信号
            twoVC.delegateSingal = [RACSubject subject];
            //订阅代理信号
            [twoVC.delegateSingal subscribeNext:^(id x) {
                NSLog(@"点击了按钮%@",x);
            }];
            UINavigationController *nav =[[UINavigationController alloc]initWithRootViewController:twoVC];
            [self presentViewController:nav animated:YES completion:nil];
            break;
        }
        case 2:
        { ThreeViewController *thressv = [[ThreeViewController alloc]init];
            [self.navigationController pushViewController:thressv animated:YES];
            
        }
        default:
            break;
    }
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [PresentTransition new];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
