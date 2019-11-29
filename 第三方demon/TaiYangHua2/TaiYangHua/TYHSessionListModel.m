//
//  TYHSessionListModel.m
//  TaiYangHua
//
//  Created by Vieene on 15/12/22.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import "TYHSessionListModel.h"
#import "TYHSessionModel.h"
@implementation TYHSessionListModel
+ (NSDictionary *)objectClassInArray
{
    return @{@"sessions": [TYHSessionModel class]};
}
@end
