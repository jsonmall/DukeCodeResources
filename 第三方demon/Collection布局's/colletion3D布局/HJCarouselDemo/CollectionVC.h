//
//  CollectionVC.h
//  HJCarouselDemo
//
//  Created by GPsmile on 16/8/15.
//  Copyright © 2016年 olinone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WaterfulldownFlowLayout.h"
@interface CollectionVC : UIViewController
@property (nonatomic,strong)UICollectionViewFlowLayout *flowLayout;
@property (nonatomic,assign)  HJCarouselAnim carouselAnim;
@end
