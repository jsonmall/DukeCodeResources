//
//  UITimerRepeatView.m
//  CloudPlatform
//
//  Created by orvibo on 15/5/13.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "UITimerRepeatView.h"

@interface RepeatCell : UITableViewCell
@property (nonatomic, strong) UIImageView *accessoryImgView;
@end
@implementation RepeatCell



@end

@interface UITimerRepeatView()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation UITimerRepeatView
{
    UITableView     *_tableView;
    NSArray         *_weekArr;
    
    /**
     *  一个字节有8位，最高位为0的时候表示执行周期为单次；最高位为1的时候，从低位到高位的前7位分别表示星期一到星期天的有效位。1表示有效、0表示无效
     */
    NSMutableDictionary *_accessoryDic;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(NSDictionary *)getRepeatDic
{
    return _accessoryDic;
}
-(void)setRepeatDic:(NSDictionary *)dic
{
    [_accessoryDic removeAllObjects];
    _accessoryDic = [[NSMutableDictionary alloc] initWithDictionary:dic copyItems:YES];
    [_tableView reloadData];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        for (int i = 0; i < 7; i++) {
            [_accessoryDic setObject:@(0) forKey:@(i)];
        }
        _weekArr = [NSArray arrayWithObjects:NSLocalizedString(@"LocalizeBle_Every_Sunday", nil),NSLocalizedString(@"Localizeble_Every_Monday", nil),
                                             NSLocalizedString(@"Localizeble_Every_Tuesday", nil),NSLocalizedString(@"Localizeble_Every_Wednesday", nil),
                                             NSLocalizedString(@"Localizeble_Every_Thursday", nil),NSLocalizedString(@"Localizeble_Every_Friday", nil),
                                             NSLocalizedString(@"Localizeble_Every_Saturday", nil),nil];
        UITableViewStyle style;
        if (IOSVersion >= 7.0) {
            style = UITableViewStyleGrouped;
        }else{
            style = UITableViewStylePlain;
        }
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, self.frame.size.height) style:style];
        _tableView.delaysContentTouches = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self addSubview:_tableView];
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 1)];
        if (IOSVersion >= 7.0) {
            if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
                [_tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
            }
        }else{
            _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        }
    }

    return self;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45*VProportion;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"timerRepeatIdentifier";
    RepeatCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[RepeatCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.textLabel.font = [UIFont systemFontOfSize:18*VProportion];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        cell.accessoryImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TimerAccessory.png"]];
        cell.accessoryImgView.frame = CGRectMake(ScreenWidth-36*HProportion, ((45-11.5)/2)*VProportion, 16*VProportion, 11.5*VProportion);
        [cell.contentView addSubview:cell.accessoryImgView];

    }
    cell.accessoryImgView.tag = indexPath.row;
    if ([[_accessoryDic objectForKey:@(indexPath.row)] isEqualToNumber:@(1)]) {
        cell.accessoryImgView.alpha = 1;
    }else{
        cell.accessoryImgView.alpha = 0;
    }
    cell.textLabel.text = _weekArr[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[_accessoryDic objectForKey:@(indexPath.row)] isEqualToNumber:@(1)]) {
        [_accessoryDic setObject:@(0) forKey:@(indexPath.row)];
    }else{
        [_accessoryDic setObject:@(1) forKey:@(indexPath.row)];
    }
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}



@end
