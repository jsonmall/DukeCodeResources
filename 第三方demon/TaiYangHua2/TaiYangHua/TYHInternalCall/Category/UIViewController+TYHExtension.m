//
//  UIViewController+TYHExtension.m
//  TaiYangHua
//
//  Created by Lc on 16/4/25.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "UIViewController+TYHExtension.h"

@implementation UIViewController (TYHExtension)
- (BOOL)isCurrentViewControllerVisible
{
    return (self.isViewLoaded && self.view.window);
}
@end
