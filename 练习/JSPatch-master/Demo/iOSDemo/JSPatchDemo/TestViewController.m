//
//  TestViewController.m
//  JSPatchDemo
//
//  Created by 郭鹏 on 16/4/20.
//  Copyright © 2016年 bang. All rights reserved.
//

#import "TestViewController.h"
typedef void (^JSBlock)(NSDictionary *arr);
@interface TestViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableview;
@property (nonatomic,strong)NSMutableArray *data;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *testview=[[UIView alloc]initWithFrame:CGRectMake(20, 100, 200, 200)];
    testview.backgroundColor=[UIColor redColor];
    
    [self.view addSubview:testview];
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(20, 50, 100, 20)];
    lable.backgroundColor=[UIColor whiteColor];
    lable.text=@"you are everything";
    [testview addSubview:lable];
    _tableview =[[UITableView alloc]
                 initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height )];
    _tableview.dataSource=self;
    _tableview.delegate=self;
    [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.view addSubview:_tableview];
    [self createDataSource];
}
- (void)createDataSource
{
    _data = [[NSMutableArray alloc] init];
    
//    for (NSInteger i = 0; i < 3; i ++) {
//        NSMutableArray *mutArray = [[NSMutableArray alloc] init];
//        for (NSInteger j = 0; j < 10; j ++) {
//            [mutArray addObject:[NSString stringWithFormat:@"Hello tableview: %ld - %ld", i, j]];
//        }
//       
//        [_data addObject:mutArray];
//    }
    for (int i=0; i<30; i++) {
        [_data addObject:[NSString stringWithFormat:@"Hello tableview: %d", i]];
    }
    [self request:^(NSString *content, BOOL success) {
        if (success) {
            NSLog(@"%@",content);
        }
    }];
}
//oc传值到js
-(void)request:(void(^)(NSString *content, BOOL success))callback
{
    callback(@"content", YES);
}
//js 传值到oc接收
-(JSBlock)genBlock
{
    NSString *ctn=@"jspath";
    JSBlock block=^(NSDictionary * arr)
    {
        NSLog(@"i am %@,version:%@",ctn,arr[@"v"]);
    };
    return block;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text=_data[indexPath.row];
    cell.textLabel.font=[UIFont systemFontOfSize:20];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
