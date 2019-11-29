//
//  TYHChartMaker.m
//  TaiYangHua
//
//  Created by Vieene on 16/1/22.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "TYHChartCellMaker.h"
#import "TYHChartCellFrame.h"
#import "TYHTimestampModel.h"
#import "TYHSessionTimestampCell.h"
#import "TYHChartTipsCell.h"
#import "TYHChartCell.h"
@implementation TYHChartCellMaker
+ (UITableViewCell *)cellInTable:(UITableView*)tableView
                  forMessageMode:(TYHChartCellFrame *)model
{
    UITableViewCell *cell = nil;
    cell = [self creatCellWithModel:model tableView:tableView];
    [(TYHChartCell *)cell setCellFrame:model];
    return cell;
}
+ (UITableViewCell *)creatCellWithModel:(TYHChartCellFrame *)model tableView:(UITableView *)tableView
{
    static NSString *const ChartCellTypeText=@"ChartCellTypeText";
    static NSString *const ChartCellTypeImage=@"ChartCellTypeImage";
    static NSString *const ChartCellTypeVoice=@"ChartCellTypeVoice";
    static NSString *const ChartCellTypeTips=@"ChartCellTypeTips";
    static NSString *const ChartCellTypeEnd=@"ChartCellTypeEnd";
    UITableViewCell *cell = nil;
    switch (model.chartMessage.itp) {
        case MessageTypeTips:{
            if (cell == nil) {
                cell = (TYHChartTipsCell *) [[TYHChartTipsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ChartCellTypeTips];
            }
        }break;
        case MessageTypeText:{
            cell = [self rsUsedCellWithTableView:tableView reUsedId:ChartCellTypeText];
        }break;
        case MessageTypeImage:{
            cell = [self rsUsedCellWithTableView:tableView reUsedId:ChartCellTypeImage];
        }break;
        case MessageTypeVoice:{
            cell = [self rsUsedCellWithTableView:tableView reUsedId:ChartCellTypeVoice];
        }break;
        case MessageTypeJudge:{
            cell = [self rsUsedCellWithTableView:tableView reUsedId:ChartCellTypeText];
        }break;
        case MessageTypeEnd:{
            cell = [self rsUsedCellWithTableView:tableView reUsedId:ChartCellTypeEnd];
        }
        default:{
            DDLogError(@"未知的ITP类型");
        }break;
    }
    return cell;
}
+ (UITableViewCell *)rsUsedCellWithTableView:(UITableView *)tabview reUsedId:(NSString *)reusedId
{
    UITableViewCell *cell = nil;
    cell = [tabview dequeueReusableCellWithIdentifier:reusedId];
    if (cell == nil) {
        cell = (TYHChartCell *) [[TYHChartCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusedId];
    }
    return cell;
}

+ (TYHSessionTimestampCell *)cellInTable:(UITableView *)tableView
                            forTimeModel:(TYHTimestampModel *)model
{
    static NSString *const cellIdentifier2=@"TYHTimestampCell";
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier2];
    
    if (cell == nil) {
        cell = (TYHSessionTimestampCell *)[[TYHSessionTimestampCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier2];
    }
    [(TYHSessionTimestampCell *)cell refreshData:model];
    return (TYHSessionTimestampCell *)cell;
}
@end
