//
//  VihomeBindGatewayList.m
//  Vihome
//
//  Created by Air on 15-2-5.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "HMDevicesBind.h"

@implementation HMDevicesBind
+(NSString *)tableName
{
    return @"devicesBind";
}
+ (BOOL)createTable
{
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists devicesBind "
                   "(userId TEXT,"
                   "uid text,"
                   "model text,"
                   "isOnline text,"
                   "isLocal text,"
                   "localIP text,"
                   "localPort integer,"
                   "versionID integer,"
                   "UNIQUE (userId, uid) ON CONFLICT REPLACE)"];
    return result;
}

- (BOOL)insertObject
{
    NSString * sql = [NSString stringWithFormat:@"insert into devicesBind (userId,uid,model,isOnline,isLocal,localIP,localPort,versionID) values('%@','%@','%@','%@','%@','%@',%d,%d)",self.userId,self.uid,self.model,self.isOnline,self.isLocal,self.localIP,self.localPort,self.versionID];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from devicesBind where uid = '%@'",self.uid];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}


- (NSDictionary *)dictionaryFromObject
{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    
    return dic;
}

-(BOOL)isVicenter{
    return isHostModel(self.model);
}
+(HMDevicesBind *)bindWithGateway:(Gateway *)gateway
{
    NSMutableString *model = [NSMutableString stringWithString:kViHomeModel];// 默认model
    
    if (gateway.model) {
        
        [model setString:gateway.model];
        
    }else{
        NSString *sql = [NSString stringWithFormat:@"select model from gateway where uid = '%@'",gateway.uid];
        queryDatabase(sql, ^(FMResultSet *rs) {
            
            [model setString:[rs stringForColumn:@"model"]];
        });
    }
    
    HMDevicesBind *bind = [[HMDevicesBind alloc]init];
    bind.userId = userAccout().userId;
    bind.model = model;
    bind.uid = gateway.uid;
    bind.isOnline = @"YES";
    bind.isLocal = @"YES";
    bind.localIP = gateway.host;
    bind.localPort = gateway.port;
    bind.versionID = gateway.versionID;
    
    return bind;
}

+(NSArray *)bindArr
{
    NSString *userId = userAccout().currentLocalAccount.userId;
    NSMutableArray *gatewayArr;
    NSString *sql = [NSString stringWithFormat:@"select * from devicesBind where userId = '%@'",userId];
    FMResultSet *rs = [[HMDatabaseManager shareDatabase] executeQuery:sql];
    while ([rs next]) {
        if (!gatewayArr) {
            gatewayArr = [[NSMutableArray alloc] initWithCapacity:1];
        }
        [gatewayArr addObject:[HMDevicesBind object:rs]];
    }
    
    [rs close];
    return gatewayArr;
}

+(BOOL)existsVihomePro
{
    NSArray *arr = [HMDevicesBind bindArr];
    BOOL existsVihomePro = NO;
    for (HMDevicesBind *gateway in arr) {
        if (isHostModel(gateway.model)) {
            existsVihomePro = YES;
            return existsVihomePro;
        }
    }
    return existsVihomePro;
}
+(NSArray *)bindArrayWithUserId:(NSString *)userId
{
    NSString *sql = [NSString stringWithFormat:@"select * from devicesBind where userId = '%@'",userId];
    NSMutableArray *gatewayArray = [NSMutableArray array];
    queryDatabase(sql, ^(FMResultSet *rs) {
        [gatewayArray addObject:[HMDevicesBind object:rs]];
    });
    return gatewayArray;
}

+(BOOL)isWifiDeviceWithUid:(NSString *)uid
{
    NSString *model = [[self class]modelWithUid:uid];
    if (model) {
        return isWifiDeviceModel(model);
    }
    return NO;
}

+(BOOL)isHostWithUid:(NSString *)uid
{
    NSString *model = [[self class]modelWithUid:uid];
    if (model) {
        return isHostModel(model);
    }
    return NO;
}

+(NSString *)modelWithUid:(NSString *)uid
{
    NSString *model = nil;
    NSString *sql = [NSString stringWithFormat:@"select model from devicesBind where userId = '%@' and uid = '%@'",userAccout().userId,uid];
    
    FMResultSet * rs = [[HMDatabaseManager shareDatabase] executeQuery:sql];
    
    if([rs next]){
        
        model = [rs stringForColumn:@"model"];
    }
    [rs close];
    
    return model;
}
@end
