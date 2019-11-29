//
//  QTBaseSettingsViewController.h
//  QTime
//
//  Created by mima on 15/7/17.
//  Copyright (c) 2015年 Mark. All rights reserved.
//
//  此类为类似设置的页面的基类，所有其子级Controller都可以集成本类进行自定义

#import "QTTableViewController.h"

#define QTBaseSettingsCellHeight 55

@class QTBaseSettingsGroup, QTBaseSettingsItem;

@interface QTBaseSettingsViewController : QTTableViewController
{
    NSMutableArray<__kindof  QTBaseSettingsGroup *> *_groups;
}

/**
 *  存放所有组，组内每个组内的Item数组
 */
@property (nonatomic, strong) NSMutableArray<__kindof  QTBaseSettingsGroup *> *groups;


- (NSMutableDictionary<NSIndexPath *, QTBaseSettingsItem *> *)listItemsWithReuserId:(NSString *)ID;
/**替换cell**/
- (NSIndexPath *)replaceItem:(QTBaseSettingsItem *)item withReuseId:(NSString *)ID;
- (NSIndexPath *)indexPathForBaseSettingsItem:(QTBaseSettingsItem *)item;
- (QTBaseSettingsItem *)baseSettingsItemAtIndexPath:(NSIndexPath *)indexPath;

- (void)reloadRowWithItem:(QTBaseSettingsItem *)item forReuseId:(NSString *)reuseId animation:(UITableViewRowAnimation)animation;

@end
