//
//  HJCarouselViewCell.h
//  HJCarouselDemo
//
//  Created by haijiao on 15/8/20.
//  Copyright (c) 2015年 olinone. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    LXRoundStyle_Circle,
    LXRoundStyle_Heart
}LXRoundStyle;
@interface HJCarouselViewCell : UICollectionViewCell
-(void)makeStyle:(LXRoundStyle)style Corner:(CGFloat)roundCorner;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end
