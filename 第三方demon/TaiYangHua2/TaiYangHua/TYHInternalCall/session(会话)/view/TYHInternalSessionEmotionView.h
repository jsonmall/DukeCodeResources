//
//  TYHInternalSessionEmotionView.h
//  TaiYangHua
//
//  Created by Lc on 16/1/26.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^didclickSender)();
@interface TYHInternalSessionEmotionView : UIView
@property (copy, nonatomic) didclickSender didclickSenderEmotion;
@end
