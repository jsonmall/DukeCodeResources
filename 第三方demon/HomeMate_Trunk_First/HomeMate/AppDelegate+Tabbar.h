//
//  AppDelegate+Tabbar.h
//  HomeMate
//
//  Created by orvibo on 15/8/12.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (Tabbar)

/**
 *  参数设置为YES显示2个item，否则显示3个item
 *
 *  @param isTwoItem
 */
-(void)setupTabBarController:(BOOL)isTwoItem;

@end
