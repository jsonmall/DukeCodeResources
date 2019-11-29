//
//  TYHInternalSessionViewController.h
//  TaiYangHua
//
//  Created by Lc on 16/1/21.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYHInternalSessionViewController : UIViewController
/** 
 *  会话标志
 *  1-个聊 2-群聊
 */
@property (assign, nonatomic) NSInteger targetType;

/**
 *  会话ID
 */
@property (copy, nonatomic) NSString *sessionId;

/**
 *  目标对象ID
 */
@property (copy, nonatomic) NSString *targetId;

/**
 *  目标对象名字
 */
@property (copy, nonatomic) NSString *targetName;

@end
