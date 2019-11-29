//
//  TYHTimestampModel.h
//
//  Created by Vieene.
//  Copyright (c) 2015年 hhly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYHTimestampModel : NSObject

- (CGFloat)cellHeight;

/**
 *  时间戳
 */
@property (nonatomic, assign) NSTimeInterval messageTime;

@end
