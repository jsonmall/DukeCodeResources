//
//  VihomeCameraInfo.m
//  Vihome
//
//  Created by Ned on 1/16/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "HMCameraInfo.h"

@implementation HMCameraInfo
+(NSString *)tableName
{
    return @"cameraInfo";
}
+ (BOOL)createTable
{
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists cameraInfo "
                   "(cameraInfoId text,"
                   "uid text,"
                   "deviceId text,"
                   "url text,"
                   "port integer,"
                   "type integer,"
                   "cameraUid text,"
                   "user text,"
                   "password text,"
                   "createTime text,"
                   "updateTime text,"
                   "delFlag integer,"
                   "UNIQUE (cameraInfoId, uid) ON CONFLICT REPLACE)"];
    return result;
}

- (BOOL)insertObject
{
    if (!self.createTime) {
        self.createTime = self.updateTime;
    }
    
    NSString * sql = [NSString stringWithFormat:@"insert into cameraInfo (cameraInfoId,uid,deviceId,url,port,type,cameraUid,user,password,createTime,updateTime,delFlag) values('%@', '%@','%@','%@', %d,%d,'%@','%@','%@','%@','%@',%d)",self.cameraInfoId,self.uid,self.deviceId,self.url,self.port,self.type,self.cameraUid,self.user,self.password,self.createTime,self.updateTime,self.delFlag];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from cameraInfo where cameraInfoId = '%@' and uid = '%@'",self.cameraInfoId,self.uid];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}


- (NSDictionary *)dictionaryFromObject
{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    return dic;
}


@end
