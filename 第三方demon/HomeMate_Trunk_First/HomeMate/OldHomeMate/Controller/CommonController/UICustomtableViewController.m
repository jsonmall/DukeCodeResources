//
//  UICustomtableViewController.m
//  CloudPlatform
//
//  Created by orvibo on 15/5/8.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "UICustomtableViewController.h"

@interface UICustomtableViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation UICustomtableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupContentViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setupContentViews
{
    UITableViewStyle tStyle;
    if (IOSVersion >= 7.0) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        tStyle = UITableViewStyleGrouped;
    }else{
        tStyle = UITableViewStylePlain;
    }
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64*VProportion, ScreenWidth, ScreenHeight - 25) style:tStyle];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 0.01)];
    if (IOSVersion >= 7.0) {
        if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [_tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
        }
    }
    _fontOfSize = 18;
    _tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
}
#pragma mark -UITableViewDataSource,UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_rowHeight < 1) {
        _rowHeight = 65*VProportion;
    }
    return _rowHeight;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"allDeviceListIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        cell.textLabel.font = [UIFont systemFontOfSize:_fontOfSize];
        cell.textLabel.textColor = RGB(51, 51, 51);
        cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
        cell.detailTextLabel.textColor = RGB(153, 153, 153);
        cell.imageView.transform=CGAffineTransformMakeScale(0.5*HProportion,0.5*HProportion);
    }
    if (_titleArr && _titleArr.count > 0) {
        cell.textLabel.text = _titleArr[indexPath.row];
    }
    if (_subTitleArr.count > 0) {
        cell.detailTextLabel.text = _subTitleArr[indexPath.row];
    }
    cell.imageView.image = [UIImage imageNamed:_imageArr[indexPath.row]];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
