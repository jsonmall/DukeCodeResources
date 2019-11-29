//
//  PublicBackBtn.h
//  夺宝吧
//
//  Created by xiaocai on 15/6/25.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum{
    dismiss = 0,
    pop
}BackType;
@interface PublicBackBtn : UIButton
//获取实例的方法
- (instancetype)initWithVC:(UIViewController *)vc andBackType:(BackType)type Img:(UIImage *)img;
@end
