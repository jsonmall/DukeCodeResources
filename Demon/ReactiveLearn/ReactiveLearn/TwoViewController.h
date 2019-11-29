//
//  TwoViewController.h
//  ReactiveLearn
//
//  Created by GPsmile on 16/10/9.
//  Copyright © 2016年 gpsmile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface TwoViewController : UIViewController
@property (nonatomic,strong)RACSubject *delegateSingal;

@end
