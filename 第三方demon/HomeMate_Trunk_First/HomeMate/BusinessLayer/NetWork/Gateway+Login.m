//
//  Gateway+Login.m
//  Vihome
//
//  Created by Air on 15/5/25.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "Gateway+Login.h"
#import "Gateway+RT.h"

@implementation Gateway (Login)
-(void)localLoginWithUserName:(NSString *)name password:(NSString *)password completion:(SocketCompletionBlock)completion
{
    LoginCmd *lgCmd = [LoginCmd object];
    lgCmd.uid = self.uid;
    lgCmd.userName = name;
    lgCmd.password = password;
    lgCmd.type = 0; // 登录页面登录
    
    __block typeof(self) weakself = self;
    [self sendCmd:lgCmd completion:^(KReturnValue returnValue, NSDictionary *returnDic) {
        
        if (returnValue == KReturnValueSuccess) {
            weakself.versionID = [returnDic[@"versionID"]intValue];
        }
        if (completion) {
            completion(returnValue,returnDic);
        }
    }];
}
-(void)localLogin:(SocketCompletionBlock)completion
{
    __block typeof(self) weakself = self;
    
    DLog(@"登录网关：uid == %@,IP == %@", weakself.uid,weakself.host);
    [self localLoginWithUserName:userAccout().userName
                        password:userAccout().password
                      completion:completion];
    
}
-(void)localLoginToReadData:(commonBlock)completion
{
    __block typeof(self) weakself = self;
    
    NSString *uid = weakself.uid;
    
    [weakself localLogin:^(KReturnValue returnValue, NSDictionary *returnDic) {
        
        if (returnValue == KReturnValueSuccess)
        { // 当前网关登录成功，去读表
        
            [weakself readTableWithUid:uid remote:NO completion:^(KReturnValue value) {
                
                BOOL readTableSuccess = (value == KReturnValueSuccess);
                
                if (readTableSuccess) {
                    
                    DLog(@"网关：uid == %@,IP == %@ 读表成功", weakself.uid,weakself.host);
                    
                }
                
                if (completion) {
                    completion(value);
                }
                
            } ];
            
        }
        else
        {
            
            DLog(@"\n\n登录失败，错误码：%d\n\n",returnValue);
            if (returnValue == KReturnValueAccountOrPWDERR) {
                DLog(@"用户名或密码错误");
            }else if(returnValue == KReturnValueMainframeRest){
                DLog(@"主机未绑定用户信息或者绑定信息已经被重置");
            }else if(returnValue == KReturnValueMainframeDisconnect){
                DLog(@"网络错误，主机连接不上服务器");
            }else if(returnValue == KReturnValueConnectError){
                DLog(@"客户端连接不上服务器");
            }else if(returnValue == KReturnValueTimeout){
                DLog(@"客户端请求超时");
            }else if(returnValue == KReturnValueNotBindMainframe){
                DLog(@"该用户名未绑定到本主机");
            }
            
            if (completion) {
                completion(returnValue);
            }
        }
    }];
}

-(void)readTableData:(commonBlock)completion
{
    __block typeof(self) weakself = self;
    NSString *uid = weakself.uid;
    
    BOOL isRemote = (!isEnableWIFI() || (self.loginType != LOCAL_LOGIN));
    
    [weakself readTableWithUid:uid remote:isRemote completion:^(KReturnValue value) {
        
        BOOL success = (value == KReturnValueSuccess);
        
        DLog(@"网关：uid == %@,IP == %@ %@读表%@",weakself.uid,weakself.host,isRemote?@"远程":@"本地",success ? @"成功":@"失败");
        if (completion) {
            
            completion(value);
        }
    }];
}
@end
