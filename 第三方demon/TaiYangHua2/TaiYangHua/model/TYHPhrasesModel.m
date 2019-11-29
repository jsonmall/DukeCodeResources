//
//  TYHPhrasesModel.m
//  TaiYangHua
//
//  Created by Vieene on 16/1/5.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "TYHPhrasesModel.h"
#import "NSString+TextSize.h"
//#import "TYHseachrVC.h"
#import "TYHsearchCell.h"
@implementation TYHPhrasesModel


+ (NSDictionary *)objectClassInArray
{
    return @{@"children": [TYHPhrasesModel class]};
}



- (CGFloat)cellContentH
{
    
   return  [self.phraseContent sizeWithFont:[UIFont systemFontOfSize:subLabelFont] MaxSize:CGSizeMake(SCREEN_W * 0.85 - 25,1000)].height + subTitleH + 19 ;
    
}
@end
