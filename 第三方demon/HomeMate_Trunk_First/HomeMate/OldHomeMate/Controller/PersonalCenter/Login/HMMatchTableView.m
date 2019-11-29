//
//  HMMatchTableView.m
//  HomeMate
//
//  Created by orvibo on 16/1/21.
//  Copyright © 2016年 Air. All rights reserved.
//

#import "HMMatchTableView.h"


@interface HMMatchTableView()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) MatchBlock matchblock;

@end

@implementation HMMatchTableView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self addSubview:_tableView];
    }
    return self;
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    _tableView.frame = self.bounds;
}

-(void)loadData:(NSArray *)dataArray block:(MatchBlock)block
{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    [self setHidden:NO];
    [_dataArray addObjectsFromArray:dataArray];
    self.matchblock = [block copy];
    [_tableView reloadData];
}

-(void)setHidden:(BOOL)hidden
{
    [super setHidden:hidden];
    [_dataArray removeAllObjects];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 46;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"matchTableViewIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.backgroundColor = RGB(233, 233, 233);
    }
    NSString *userName = ((HMLocalAccount *)_dataArray[indexPath.row]).lastUserName;
    cell.textLabel.text = userName;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *userName = ((HMLocalAccount *)_dataArray[indexPath.row]).lastUserName;
    self.matchblock(userName);
    [self setHidden:YES];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
