//
//  TYHInternalAssetCell.m
//  TaiYangHua
//
//  Created by Lc on 16/2/16.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "TYHInternalAssetCell.h"

@implementation TYHInternalAssetCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.contentMode = UIViewContentModeScaleAspectFit;
        imageV.userInteractionEnabled = YES;
        _imageView = imageV;
        [self.contentView addSubview:_imageView];
        
//        UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
//                UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
//        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        
//        
//                pan.delegate = self;
//                pinch.delegate = self;
//                rotation.delegate = self;
        
//        [self.contentView addGestureRecognizer:pinch];
//                [_imageView addGestureRecognizer:rotation];
//        [self.contentView addGestureRecognizer:pan];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(5);
        make.right.equalTo(self.contentView).offset(-5);
    }];
}


//- (void)pinch:(UIPinchGestureRecognizer *)pinch
//{
//    self.contentView.transform = CGAffineTransformScale(self.contentView.transform, pinch.scale, pinch.scale);
//    pinch.scale = 1;
//    
//}

//- (void)rotation:(UIRotationGestureRecognizer *)rotation
//{
//    _imageView.transform = CGAffineTransformRotate(_imageView.transform, rotation.rotation);
//
//    rotation.rotation = 0;
//
//}

//- (void)pan:(UIPanGestureRecognizer *)pan
//{
//    
//    CGPoint transP = [pan translationInView:self.contentView];
//    
//    DLog(@"%f", transP.x);
//    self.contentView.transform = CGAffineTransformTranslate(self.contentView.transform, transP.x, transP.y);
//    
//    [pan setTranslation:CGPointZero inView:self.contentView];
//}
//
//
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
//{
//    return YES;
//}
@end
