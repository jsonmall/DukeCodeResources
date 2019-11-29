//
//  LiveHttpRequest.m
//  MeetingAll
//
//  Created by GPsmile on 16/8/19.
//  Copyright © 2016年 gpsmile. All rights reserved.
//

#import "LiveHttpRequest.h"

@implementation LiveHttpRequest
static LiveHttpRequest *_manger;
+(instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manger=[LiveHttpRequest manager];
        //设置超时时间
        _manger.requestSerializer.timeoutInterval=5.0;
        _manger.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];
        
    });
    return _manger;
    
}
+(NetworkStates)getNetWorkStates
{
    NSArray *subViews=[[[[UIApplication sharedApplication] valueForKey:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    //保存网络状态
    NetworkStates states =NetworkStatesNone;
    for (id child in subViews) {
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            //获取到状态栏码
            int networkType = [[child valueForKeyPath:@"dataNetworkType"] intValue];
            switch (networkType) {
                case 0:
                    states = NetworkStatesNone;
                    //无网模式
                    break;
                case 1:
                    states = NetworkStates2G;
                    break;
                case 2:
                    states = NetworkStates3G;
                    break;
                case 3:
                    states = NetworkStates4G;
                    break;
                case 5:
                {
                    states = NetworkStatesWIFI;
                }
                    break;
                default:
                    break;
            }
        }
    }
    //根据状态选择
    return states;
}
-(void)requestHotLiveWithPage:(NSInteger)pageIndex succes:(HttpSuccess)succes failure:(HttpFailue)failue
{
    [[LiveHttpRequest shareInstance] GET:[NSString stringWithFormat:@"http://live.9158.com/Fans/GetHotLive?page=%ld",pageIndex] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *arrm=[NSMutableArray array];
        NSArray *result=[ALinLiveMode mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
        if ([result isKindOfClass:[NSArray class]] && result.count>0) {
            [arrm addObjectsFromArray:result];
            succes(arrm);
        }else{
            succes(nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failue(error);
    }];
}
@end
