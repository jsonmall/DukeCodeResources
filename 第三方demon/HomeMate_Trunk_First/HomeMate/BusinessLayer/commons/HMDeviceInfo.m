//
//  HMCityDbInfo.m
//  HomeMate
//
//  Created by liuzhicai on 16/1/18.
//  Copyright © 2016年 Air. All rights reserved.
//

#import "HMDeviceInfo.h"
#import "HMLocalDbManager.h"
#import "HMDeviceDesc.h"
#import "HMDeviceLanguage.h"
#import "HMQrCodeModel.h"
#import "HMWeatherNetWork.h"

@implementation HMDeviceInfo


+ (void)getDeviceInfoFromServer
{
    dispatch_queue_t queue = dispatch_queue_create("com.orvibo.getDeviceInfoFromServer", NULL);
    
    dispatch_async(queue, ^{
        NSError *error = nil;
        
        int lastUpdateTime = [self getLastUpdateTime];

        NSString *urlString = [NSString stringWithFormat:kGet_DeviceDesc_URL,lastUpdateTime,HMAppName];
        urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
        if (data) {
            NSDictionary *deviceInfoDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            
            if (!error && deviceInfoDic) {
                NSNumber *errorCode = deviceInfoDic[@"errorCode"];
                
                    if (errorCode.intValue == KReturnValueSuccess) {
                        
                        // 保存返回的最大更新时间
                        NSInteger deviceInfoLastUpdateTime = [deviceInfoDic[@"lastUpdateTime"] integerValue];
                        [UserDefaults setInteger:deviceInfoLastUpdateTime forKey:kDeviceInfoLastUpdateTime];
                        [UserDefaults synchronize];
                        
                        DLog(@"http获取设备信息成功");
                        
                        // 设备信息表
                        NSArray *deviceDescArr = [deviceInfoDic objectForKey:@"deviceDescList"];
                        if ([deviceDescArr isKindOfClass:[NSArray class]]) {
                            for (NSDictionary *dic in deviceDescArr) {
                                HMDeviceDesc *deviceDescObj = [HMDeviceDesc objectFromDictionary:dic];
                                [deviceDescObj insertObject];
                            }
                        }
                        
                        
                        // 设备语言包表
                        NSArray *deviceLanguageArr = [deviceInfoDic objectForKey:@"deviceLanguageList"];
                        if ([deviceLanguageArr isKindOfClass:[NSArray class]]) {
                            for (NSDictionary *dic in deviceLanguageArr) {
                                HMDeviceLanguage *dlObj = [HMDeviceLanguage objectFromDictionary:dic];
                                [dlObj insertObject];
                            }
                        }
                        
                        
                        // 二维码对照表
                        NSArray *qrCodeArr = [deviceInfoDic objectForKey:@"qrCodeList"];
                        if ([qrCodeArr isKindOfClass:[NSArray class]]) {
                            for (NSDictionary *dic in qrCodeArr) {
                                HMQrCodeModel *qrObj = [HMQrCodeModel objectFromDictionary:dic];
                                [qrObj insertObject];
                            }
                        }
                    }
            }
        }
    });
}

+ (int)secsWithString:(NSString *)str {
    
    NSTimeInterval interval = [dateWithString(str) timeIntervalSince1970];
    int sec = interval;
    return sec;
}

// 本地数据库即内置在bundle的三张表的最大时间
+ (int)getLastUpdateTime
{
    int lastUpdatime = 0;

    NSString *sql = [NSString stringWithFormat:@"select max(updateTime) as MaxUpdateTime from (select max(updateTime) as updateTime from deviceDesc UNION select max(updateTime) as updateTime from deviceLanguage UNION select max(updateTime) as updateTime from qrCode)"];
    FMResultSet *set = [[HMLocalDbManager shareDatabase] executeQuery:sql];
    if ([set next]) {
        NSString *dateStr = [set stringForColumn:@"MaxUpdateTime"];
        lastUpdatime = [self secsWithString:dateStr];
    }
    [set close];
    return lastUpdatime;
}

@end
