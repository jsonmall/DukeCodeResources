//
//  QTBaseSettingsItem.h
//  QTime
//
//  Created by mima on 15/7/17.
//  Copyright (c) 2015年 Mark. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QTBaseSettingsItem, QTBaseSettingsCell;

typedef void(^BaseSettingActionBlock)(UITableView *tableView, QTBaseSettingsCell *cell, NSIndexPath *indexPath);

typedef enum
{
    
    QTBaseSettingsItemTypeNone,                   //无
    QTBaseSettingsItemTypeDefault,                //默认
    QTBaseSettingsItemTypeDisclosureIndicator,    // regular chevron. doesn't track
    QTBaseSettingsItemTypeDetailDisclosureButton, // info button w/ chevron. tracks
    QTBaseSettingsItemTypeCheckmark,              // checkmark. doesn't track
    QTBaseSettingsItemTypeDetailButton,           // info button. tracks
    QTBaseSettingsItemTypeCustomize,              //自定义
    QTBaseSettingsItemTypeAllCustomize            //完全自定义
    
} QTBaseSettingsItemType;

@interface QTBaseSettingsItem : NSObject


@property (nonatomic, copy  ) NSString               *reuseId; ///< 复用时的id，一般指定不一样的，不需要重复使用

@property (nonatomic, copy  ) NSString               *titleText; ///< 标题的自定义
@property (nonatomic, strong) UIFont                 *titleTextFont;
@property (nonatomic, strong) UIColor                *titleTextColor;

@property (nonatomic, copy  ) NSString               *detailText; ///< 详情的自定义
@property (nonatomic, strong) UIFont                 *detailTextFont;
@property (nonatomic, strong) UIColor                *detailTextColor;

@property (nonatomic, assign) CGFloat                heightForCell; ///< cell的高度

@property (nonatomic, copy  ) NSString               *img; ///< 图片
@property (nonatomic, strong) UIImage                *image; ///< 图片
@property (nonatomic, strong) NSURL                  *imageUrl; ///< 图片


@property (nonatomic, assign) BOOL                   hideSeperateLine; ///< 是否隐藏分割线，默认NO;


@property (nonatomic, assign) NSInteger              tag;

@property (nonatomic, strong) UIView                 *accessoryView; ///< 右边自定义view

@property (nonatomic, strong) UIView                 *baseBackgroundView; ///< AllCustomized时候覆盖在cell上面的view

@property (nonatomic, assign) QTBaseSettingsItemType settingsType;

@property (nonatomic, copy  ) BaseSettingActionBlock actionBlock;

@property (nonatomic, assign, getter=isClearHighlight) BOOL clearHighlight;///< 是否去掉点击高亮效果

@property (nonatomic, copy  ) Class targetClass;

- (void)setActionBlock:(BaseSettingActionBlock)actionBlock;

+ (instancetype)item;

@end
