//
//  DelayButton.h
//  ABB
//
//  Created by orvibo on 14-3-26.
//  Copyright (c) 2014年 orvibo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DelayButton : UIButton

@property (nonatomic , assign) BOOL delayEnable;
@property (nonatomic , assign) CGFloat delayTime;

-(void)initVariable;
@end
