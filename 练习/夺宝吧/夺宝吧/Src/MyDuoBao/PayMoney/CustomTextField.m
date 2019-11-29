//
//  CustomTextField.m
//  夺宝吧
//
//  Created by xiaocai on 15/11/25.
//  Copyright © 2015年 FangYuan. All rights reserved.
//

#import "CustomTextField.h"

@implementation CustomTextField

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    if (action == @selector(paste:)){
        return NO;
    }
    if (action == @selector(select:)){
        return NO;
    }
    if (action == @selector(selectAll:)){
        return NO;
    }
    
    return [super canPerformAction:action withSender:sender];
    
}

@end
