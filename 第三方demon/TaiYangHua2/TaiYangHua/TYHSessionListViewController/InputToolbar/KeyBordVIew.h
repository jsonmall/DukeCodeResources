//
//  TYHKitUtil.h
//  TaiYangHua
//
//  Created by Vieene on 16/1/22.
//  Copyright © 2016年 hhly. All rights reserved.
//
#import <UIKit/UIKit.h>

@class KeyBordVIew;

@protocol KeyBordVIewDelegate <NSObject>

-(void)KeyBordView:(KeyBordVIew *)keyBoardView textFiledReturn:(UITextField *)textFiled;
-(void)KeyBordView:(KeyBordVIew *)keyBoardView textFiledBegin:(UITextField *)textFiled;
-(void)beginRecord;
-(void)finishRecord;
@end

@interface KeyBordVIew : UIView
@property (nonatomic,assign) id<KeyBordVIewDelegate>delegate;
@end
