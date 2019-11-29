//
//  PopView.h
//  夺宝吧
//
//  Created by xiaocai on 15/7/24.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopView : UIView
{
    UILabel         *_textLabel;
    int             _queueCount;
}

- (void) setText:(NSString *) text;
@end
