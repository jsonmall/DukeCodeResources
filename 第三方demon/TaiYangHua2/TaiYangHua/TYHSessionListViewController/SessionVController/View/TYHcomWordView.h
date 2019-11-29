//
//  TYHcomWordView.h
//  TaiYangHua
//
//  Created by Vieene on 16/4/18.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYHcomWordView : UIView
@property (nonatomic,strong) NSArray *modelArray;
@property (nonatomic,copy) void (^closeCommwordblock)();//不显示常用语
@property (nonatomic,copy) void (^touchBlock)(id view);//touch常用语视图

- (void)open;
@end
