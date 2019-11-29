//
//  VhDeviceBind.m
//  HomeMate
//
//  Created by liqiang on 15/8/12.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "VhDeviceBind.h"
#import "VhAPConfig.h"

@interface VhDeviceBind ()
@property (assign, nonatomic)int serialNumber;
@end

@implementation VhDeviceBind


/**
 *  解绑设备
 *
 *  @param device
 */
- (void)unBindDevice:(VHAPDevice *)device callback:(BindCallback)callback {
    HM_LOG(@"一直解绑");
    if (self.isStop) {
        //        callback(KReturnValueSuccess,nil);
        HM_LOG(@"---------------停止解绑----------------");
        
        return;
    }
    
    DeviceUnbindCmd *deviceUnbind = [DeviceUnbindCmd object];
    if (self.serialNumber == 0) {
        self.serialNumber = [BLUtility getTimestamp];
    }
    deviceUnbind.serialNo = self.serialNumber;
    
    HM_LOG(@"---------------发送解绑命令 serialNumber  %d----------------",self.serialNumber);
    
    
    if (device.mac.length) {
        deviceUnbind.uid = device.mac;
    }else {
        deviceUnbind.uid = @"";
        HM_LOG(@"解绑Uid 为空");
        
    }
    deviceUnbind.sendToServer = YES;
    HM_LOG(@"-------------------ap 解绑 发送解绑命令--------------------------");
    sendCmd(deviceUnbind, ^(KReturnValue returnValue, NSDictionary *returnDic){
        if (returnValue == KReturnValueSuccess){
            self.serialNumber = 0;
            DLog(@"-------------------ap 解绑成功 直接发送绑定命令--------------------------");
            [[VhAPConfig defaultConfig] startBindDevice];
            HM_LOG(@"解绑成功");
            
        }else if (returnValue == KReturnValueMainframeDisconnect
                  || returnValue == KReturnValueConnectError) {
            HM_LOG(@"解绑网络不存在，再次发送解绑命令");
            sleep(1);
            [self unBindDevice:device callback:callback];
            
        }else {
            callback(KReturnValueServerUnbindFail,returnDic);
        }
    });
    
}
/**
 *  绑定设备
 *
 *  @param device
 *  @param callback
 */
- (void)bindDevice:(VHAPDevice *)device callback:(BindCallback)callback {
    HM_LOG(@"-----------解绑成功，开始绑定-------------");
    
    [self deviceToCMD:device callback:callback];
    
}
- (void)deviceToCMD:(VHAPDevice *)device callback:(BindCallback)callback {
    
    DeviceBindCmd * cmd  = [[DeviceBindCmd alloc] init];
    cmd.bindUID = device.mac;
    [self sendBindCmd:cmd callback:callback];
    
    
}


- (void)sendBindCmd:(DeviceBindCmd *)cmd callback:(BindCallback)callback {
    
    HM_LOG(@"-----------解绑成功，发送绑定命令-------------");
    
    
    sendLACmd(cmd, NO, NO, ^(KReturnValue returnValue, NSDictionary *returnDic) {
        callback(returnValue, returnDic);
        
    });
}

/**
 *  是否取消绑定
 *
 *  @param isStop
 */
- (void)stopBindDevice:(BOOL)isStop {
    self.isStop = isStop;
}
@end
