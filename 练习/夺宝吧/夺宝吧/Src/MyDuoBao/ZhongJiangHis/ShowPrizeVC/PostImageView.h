//
//  PostImageView.h
//  夺宝吧
//
//  Created by xiaocai on 15/8/4.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostImageView : UIImageView
//是否是默认图片
@property (nonatomic,assign)BOOL isDefault;
//对应的图片链接
@property (nonatomic,strong)NSString *imgPath;
//对应要上传的图片链接
@property (nonatomic,strong)NSString *postPath;
//相册中选择的tag
@property (nonatomic,assign)NSInteger choseTag;
@end
