//
//  TYHbaseNavigationVC.m
//  TaiYangHua
//
//  Created by Vieene on 15/12/29.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import "TYHbaseNavigationVC.h"
#import "UIImage+CH.h"
@interface TYHbaseNavigationVC ()

@end

@implementation TYHbaseNavigationVC

+(void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barStyle = UIBarStyleBlackOpaque;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
//    UIColor *color = color227shallblue;
//    self.navigationBar.shadowImage = [UIImage imageWithColor:color];
//    self.navigationBar.barTintColor = color;
//    self.navigationBar.backgroundColor = color;
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
    UIView *overLayer = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 64)];
    [self.navigationBar insertSubview:overLayer atIndex:0];
    overLayer.backgroundColor = color227shallblue;
 
 
    UIColor * color1 = [UIColor whiteColor];
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color1 forKey:NSForegroundColorAttributeName];
    self.navigationBar.titleTextAttributes = dict;
}


@end
