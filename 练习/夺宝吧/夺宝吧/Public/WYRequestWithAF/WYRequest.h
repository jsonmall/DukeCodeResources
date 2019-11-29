//
//  WYRequest.h
//  AFNetWorking请求数据框架
//
//  Created by 王琰 on 14-11-21.
//  Copyright (c) 2014年 王琰. All rights reserved.
//

#import <Foundation/Foundation.h>
//get请求成功Block
typedef void(^GetRequestBlock)(NSData *responseData,NSString *responseString);
//Post请求成功Block
typedef void(^PostRequestBlock)(NSData *responseData,NSString *responseString);
//请求成功返回字典的回调
typedef void(^PostDicBlock)(NSDictionary *dic);
//请求失败的Block
typedef void(^Failed)(void);
@interface WYRequest : NSObject
//外部POST请求回调方法
- (void)startPostDataWithUrlStR:(NSString *)urlStr Parameters:(NSDictionary *)pDic successBlock:(PostRequestBlock)finishedBlock failedBlock:(Failed)failedBlock;

//外部post请求 返回字典的方法
+ (void)startPostForDicWithUrlStR:(NSString *)urlStr Parameters:(NSDictionary *)pDic successBlock:(PostDicBlock)finishedBlock failedBlock:(Failed)failedBlock needLog:(BOOL)flag;
//外部统计请求 返回字典的方法
+ (void)startPostForTongJiWithUrlStR:(NSString *)urlStr Parameters:(NSDictionary *)pDic successBlock:(PostDicBlock)finishedBlock failedBlock:(Failed)failedBlock needLog:(BOOL)flag;
//检测网络
+ (void)checkNetStatu;
//停止所有网络请求
+ (void)stopAllRequest;

//http头
+ (NSString *)httpHeaderFieldString;

@end
