//
//  HMLocalDbManager.h
//  HomeMate
//
//  Created by liuzhicai on 16/1/18.
//  Copyright © 2016年 Air. All rights reserved.
//

#import <Foundation/Foundation.h>


// 用于本地数据库查询 city.db
@interface HMLocalDbManager : NSObject

+ (HMLocalDbManager *)shareDatabase;

- (FMResultSet *)executeQuery:(NSString *)sql;

- (BOOL)executeUpdateSql:(NSString *)sql;





@end
