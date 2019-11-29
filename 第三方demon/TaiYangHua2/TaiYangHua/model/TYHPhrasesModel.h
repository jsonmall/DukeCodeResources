//
//  TYHPhrasesModel.h
//  TaiYangHua
//
//  Created by Vieene on 16/1/5.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYHPhrasesModel : NSObject
//常用语ID
@property (nonatomic,copy)NSString * phraseId;
//
@property (nonatomic,copy)NSString * title; //二级使用
//常用语内容
@property (nonatomic,copy)NSString * phraseContent;//三级使用
//phraseName常用语类别名称
@property (nonatomic,copy)NSString * phraseName;  //tabview 头部

@property (nonatomic,strong)NSMutableArray * children;
//记录是否选中
@property (nonatomic,assign)BOOL isOpen;

//计算cellHight
@property (nonatomic,assign) CGFloat cellContentH;
@end
