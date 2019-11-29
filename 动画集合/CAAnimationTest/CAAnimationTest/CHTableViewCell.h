//
//  CHTableViewCell.h
//  CAAnimationTest
//
//  Created by JCH on 16/1/9.
//  Copyright © 2016年 JCH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIButton *plusBtn;
@property (strong, nonatomic) IBOutlet UIButton *minusBtn;
@property (strong, nonatomic) IBOutlet UILabel *numberLabel;



@property (nonatomic, strong) void(^plusTapHandle)(CGPoint position);
@property (nonatomic, strong) void(^minusTapHandle)();


@end
