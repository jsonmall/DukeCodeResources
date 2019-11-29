//
//  VihomeGateway.m
//  Vihome
//
//  Created by Ned on 1/16/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "HMGateway.h"

@implementation HMGateway
+(NSString *)tableName
{
    return @"gateway";
}
+ (BOOL)createTable
{
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists gateway "
                   "(gatewayId text,"
                   "userId text,"
                   "versionID integer,"
                   "hardwareVersion text,"
                   "softwareVersion integer,"
                   "staticServerPort integer,"
                   "staticServerIP text,"
                   "domainServerPort integer,"
                   "domainName text,"
                   "localStaticIP text,"
                   "localGateway text,"
                   "localNetMask text,"
                   "dhcpMode integer,"
                   "model text,"
                   "homeName text,"
                   "uid text UNIQUE ON CONFLICT REPLACE,password text,"
                   "timeZone text,"
                   "dst integer,"
                   "channel integer,"
                   "panID integer,"
                   "externalPanID integer,"
                   "securityKey text,"
                   "masterSlaveFlag integer,"
                   "coordinatorVersion text,"
                   "systemVersion text,"
                   "createTime text,"
                   "updateTime text,"
                   "delFlag integer)"];
    return result;
}

- (BOOL)insertObject
{
    if (!self.userId) {
        self.userId = userAccout().userId;
    }
    if (!self.timeZone) {
        self.timeZone = @"-1";
    }
    if (!self.coordinatorVersion) {
        self.coordinatorVersion = @"-1";
    }
    if (!self.systemVersion) {
        self.systemVersion = @"-1";
    }
    
    if (!self.createTime) {
        self.createTime = self.updateTime;
    }
    
    NSString * sql = [NSString stringWithFormat:@"insert into gateway (gatewayId,userId,versionID,hardwareVersion,softwareVersion,staticServerPort,staticServerIP,domainServerPort,domainName,localStaticIP,localGateway,localNetMask,dhcpMode,model,homeName,uid,password,timeZone,dst,channel,panID,externalPanID,securityKey,masterSlaveFlag,coordinatorVersion,systemVersion,createTime,updateTime,delFlag) values('%@','%@',%d,'%@','%@',%d,'%@',%d,'%@','%@','%@','%@',%d,'%@','%@','%@','%@','%@',%d,%d,%d,%d,'%@',%d,'%@','%@','%@','%@',%d)",self.gatewayId,self.userId,self.versionID,self.hardwareVersion,self.softwareVersion,self.staticServerPort,self.staticServerIP,self.domainServerPort,self.domainName,self.localStaticIP,self.localGateway,self.localNetMask,self.dhcpMode,self.model,self.homeName,self.uid,self.password,self.timeZone,self.dst,self.channel,self.panID,self.externalPanID,self.securityKey,self.masterSlaveFlag,self.coordinatorVersion,self.systemVersion,self.createTime,self.updateTime,self.delFlag];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from gateway where gatewayId = '%@'",self.gatewayId];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

- (NSDictionary *)dictionaryFromObject
{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    return dic;
}

+(HMGateway *)objectWithUid:(NSString *)uid
{
    NSString *sql = [NSString stringWithFormat:@"select * from gateway where uid = '%@'",uid];
    FMResultSet *rs = [[HMDatabaseManager shareDatabase] executeQuery:sql];
    HMGateway *gateway;
    if ([rs next]) {
        gateway = [HMGateway object:rs];
    }
    [rs close];
    return gateway;
}

+(NSArray *)gatewayArr
{
    NSString *userId = userAccout().currentLocalAccount.userId;
    NSMutableArray *gatewayArr;
    NSString *sql = [NSString stringWithFormat:@"select * from gateway where userId = '%@'",userId];
    FMResultSet *rs = [[HMDatabaseManager shareDatabase] executeQuery:sql];
    while ([rs next]) {
        if (!gatewayArr) {
            gatewayArr = [[NSMutableArray alloc] initWithCapacity:1];
        }
        [gatewayArr addObject:[HMGateway object:rs]];
    }
    [rs close];
    return gatewayArr;
}

+(BOOL)existsVihomePro
{
    NSArray *arr = [HMGateway gatewayArr];
    BOOL existsVihomePro = NO;
    for (HMGateway *gateway in arr) {
        if (isHostModel(gateway.model)) {
            existsVihomePro = YES;
            return existsVihomePro;
        }
    }
    return existsVihomePro;
}

-(NSString *)model
{
    // 兼容 VIH004 是中性版本
    if ([_model isEqualToString:kNormalViHomeModel]) {
        return kNormalGatewayModelID;
    }
    return _model;
}

@end
