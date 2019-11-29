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
        
        self.backgroundColor = [UIColor blackColor];
        
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.contentMode = UIViewContentModeScaleAspectFit;
        _imageView = imageV;
        [self.contentView addSubview:_imageView];
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
@end
