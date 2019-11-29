//
//  QTBaseSettingsGroup.h
//  QTime
//
//  Created by Jren on 16/1/8.
//  Copyright © 2016年 Mark. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QTBaseSettingsItem;

@interface QTBaseSettingsGroup : NSObject

+ (instancetype)group;

@property (nonatomic, strong) NSMutableArray<__kindof QTBaseSettingsItem *> *items;

@property (nonatomic, assign) CGFloat heighForHeader;
@property (nonatomic, assign) CGFloat heighForFooter;

@property (nonatomic, copy  ) NSString *titleForHeader;
@property (nonatomic, copy  ) NSString *titleForFooter;

@end
