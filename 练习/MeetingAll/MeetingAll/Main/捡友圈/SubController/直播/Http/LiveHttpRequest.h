//
//  LiveHttpRequest.h
//  MeetingAll
//
//  Created by GPsmile on 16/8/19.
//  Copyright © 2016年 gpsmile. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "ALinLiveMode.h"
@interface LiveHttpRequest : AFHTTPSessionManager
+(instancetype)shareInstance;
+(NetworkStates)getNetWorkStates;
-(void)requestHotLiveWithPage:(NSInteger )pageIndex succes:(HttpSuccess)succes failure:(HttpFailue)failue;

@end
