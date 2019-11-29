//
//  RequestKeyCmd.m
//  Vihome
//
//  Created by Ned on 1/26/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "RequestKeyCmd.h"

@implementation RequestKeyCmd

-(NSString *)userName
{
    return nil;
}
-(KEncryptedType)protocolType
{
    return KEncryptedTypePK; // 只有申请通信密钥时使用公钥，其他指令都使用动态密钥
}
-(NSString *)sessionId
{
    return nil; // 发送此命令时 session 尚未建立
}

-(NSString *)key
{
    return PUBLICAEC128KEY; // 当前命令肯定使用公钥
}

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_RK;
}
-(NSString *)softwareVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return app_Version;
    
}

-(NSString *)sysVersion
{
    return [NSString stringWithFormat:@"iOS %@",[[UIDevice currentDevice] systemVersion]];
}
-(NSString *)hardwareVersion
{
    return getCurrentDeviceModel();
}
-(NSString *)source
{
    return HMAppName;
}
-(NSString *)language
{
    return language();
}


-(NSDictionary *)payload
{
    [sendDic setObject:self.source forKey:@"source"];
    [sendDic setObject:self.softwareVersion forKey:@"softwareVersion"];
    [sendDic setObject:self.sysVersion forKey:@"sysVersion"];
    [sendDic setObject:self.hardwareVersion forKey:@"hardwareVersion"];
    [sendDic setObject:self.language forKeyedSubscript:@"language"];
    return sendDic;
}


@end
