//
//  CustomNavigationController.m
//  CustomNavigationBarDemo
//
//  Created by jimple on 14-1-6.
//  Copyright (c) 2014年 Jimple Chen. All rights reserved.
//

#import "CustomNavigationController.h"

@interface CustomNavigationController()<UINavigationControllerDelegate>

@property (nonatomic, assign) BOOL isSwitching;

@end

@implementation CustomNavigationController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.wantsFullScreenLayout = YES;
    }
    return self;
}

//-(id)initWithCoder:(NSCoder *)aDecoder
//{
//    self = [super initWithCoder:aDecoder];
//    if (self) {
//        self.wantsFullScreenLayout = YES;
//    }
//    return self;
//}
- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.wantsFullScreenLayout = YES;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.isSwitching = NO;
    self.delegate = self;
    [self setNavigationBarHidden:NO];       // 使导航条有效
    [self.navigationBar setHidden:YES];     // 隐藏导航条，但由于导航条有效，系统的返回按钮页有效，所以可以使用系统的右滑返回手势。
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 是否可右滑返回
- (void)navigationCanDragBack:(BOOL)bCanDragBack
{
    if (IsiOS7Later)
    {
        self.interactivePopGestureRecognizer.enabled = bCanDragBack;
    }else{}
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (!self.isSwitching) {
        self.isSwitching = YES;
    }else{
        return;
    }
    [super pushViewController:viewController animated:animated];
}

-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    self.isSwitching = NO;
}


@end
