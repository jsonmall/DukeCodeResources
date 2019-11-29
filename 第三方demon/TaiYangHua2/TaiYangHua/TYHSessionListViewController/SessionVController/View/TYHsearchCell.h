//
//  TYHsearchCell.h
//  TaiYangHua
//
//  Created by Vieene on 16/1/4.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TYHPhrasesModel;
extern float subTitleH;
extern float subLabelFont;
@interface TYHsearchCell : UITableViewCell

@property (nonatomic,strong)TYHPhrasesModel *model;

@property (nonatomic,copy) void (^clickemail)(BOOL isOpen);

@end
