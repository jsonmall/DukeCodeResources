//
//  XMScrollView.m
//  XMProfileDemo
//
//  Created by sfk-ios on 2018/4/27.
//  Copyright © 2018年 aiq西米. All rights reserved.
//

#import "XMScrollView.h"

@implementation XMScrollView

//返回YES，可以多个手势一起触发方法
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
