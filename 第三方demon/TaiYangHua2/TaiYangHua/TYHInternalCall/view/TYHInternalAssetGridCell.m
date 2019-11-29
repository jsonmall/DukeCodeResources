//
//  TYHInternalAssetGridCell.m
//  TaiYangHua
//
//  Created by Lc on 16/2/15.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "TYHInternalAssetGridCell.h"
#import "TYHInternalAsset.h"

@interface TYHInternalAssetGridCell ()

@property (weak, nonatomic) UIImageView *imageView;
@property (weak, nonatomic) UIButton *selectedButton;
@end

@implementation TYHInternalAssetGridCell

#pragma mark - lazy

- (UIButton *)selectedButton
{
    if (!_selectedButton) {
        UIButton *selectedButton = [[UIButton alloc] init];
        [selectedButton setImage:[UIImage imageNamed:@"unselectedIcon"] forState:UIControlStateNormal];
        [selectedButton setImage:[UIImage imageNamed:@"selectedIcon"] forState:UIControlStateSelected];
        [selectedButton addTarget:self action:@selector(clickSelectedButton:) forControlEvents:UIControlEventTouchUpInside];
        _selectedButton = selectedButton;
        [self.contentView addSubview:_selectedButton];
    }
    
    return _selectedButton;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.layer.masksToBounds = YES;
        _imageView = imageView;
        [self.contentView addSubview:_imageView];
    }
    
    return _imageView;
}

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self imageView];
        [self selectedButton];
    }
    
    return self;
}

- (void)setInternalAsset:(TYHInternalAsset *)internalAsset
{
    _internalAsset = internalAsset;
    
    [[PHImageManager defaultManager] requestImageForAsset:internalAsset.asset targetSize:internalAsset.assetGridThumbnailSize contentMode:PHImageContentModeAspectFill options:nil resultHandler:^(UIImage * _Nullable image, NSDictionary * _Nullable info) {
        self.imageView.image = image;
        self.selectedButton.selected = internalAsset.isSelected;
    }];
}

- (void)clickSelectedButton:(UIButton *)selectedButton
{
    if ([self.delegate respondsToSelector:@selector(internalAssetGridCell:isSelected:isNeedToAdd:)]) {
        [self.delegate internalAssetGridCell:self isSelected:!selectedButton.isSelected isNeedToAdd:^(BOOL add) {
            if (add) {
                [self shakeToShow:selectedButton];
                selectedButton.selected = !selectedButton.isSelected;
                self.internalAsset.selected = selectedButton.isSelected;
            }
        }];
    }
}

- (void)shakeToShow:(UIButton*)button
{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.5;
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [button.layer addAnimation:animation forKey:nil];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
    [self.selectedButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(3);
        make.right.equalTo(self.contentView).offset(-3);
        make.size.equalTo(@(30));
    }];
}

@end
