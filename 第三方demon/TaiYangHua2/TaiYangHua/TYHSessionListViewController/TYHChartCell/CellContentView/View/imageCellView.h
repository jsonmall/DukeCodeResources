//
//  ImageCellView.h
//  TaiYangHua
//
//  Created by Vieene on 15/12/30.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TYHChartMessage;
@interface ImageCellView : UIImageView
@property (nonatomic,strong)UIImageView *imageContainer;


//进度
@property(nonatomic,assign)CGFloat progress;
//消息模型（用于自己发送的图片URl和获取本地图片显示）
@property (nonatomic,strong) TYHChartMessage *chartMessage;

@end
