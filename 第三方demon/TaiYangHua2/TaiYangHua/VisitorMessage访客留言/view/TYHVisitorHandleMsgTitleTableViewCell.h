//
//  TYHVisitorHandleMsgTitleTableViewCell.h
//  TaiYangHua
//
//  Created by HHLY on 15/12/24.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYHVisitorHandleMsgTitleTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel1;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel2;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel3;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel4;

- (void)setHandleMsgTitleColor:(UIColor *)color;

@end
