//
//  FrequentlyModeModel.m
//  
//
//  Created by Air on 15/12/4.
//
//

#import "HMFrequentlyModeModel.h"

@implementation HMFrequentlyModeModel

+(NSString *)tableName
{
    return @"frequentlyMode";
}
+ (BOOL)createTable
{
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:@"CREATE TABLE if not exists frequentlyMode("
                   "frequentlyModeId text,"
                   "uid text,"
                   "modeId Integer,"
                   "name text,"
                   "deviceId text,"
                   "bindOrder text,"
                   "value1 Integer,"
                   "value2 Integer,"
                   "value3 Integer,"
                   "value4 Integer,"
                   "createTime text,"
                   "updateTime text,"
                   "delFlag Integer,"
                   "UNIQUE(frequentlyModeId, uid) ON CONFLICT REPLACE)"];
    return result;
}
+ (instancetype)objectWithDeviceId:(NSString *)deviceId uid:(NSString *)uid
{
    NSString *sql = [NSString stringWithFormat:@"select * from frequentlyMode where deviceId = '%@' and uid = '%@'",deviceId,uid];
    
    FMResultSet * rs = [[HMDatabaseManager shareDatabase] executeQuery:sql];
    
    if([rs next])
    {
        HMFrequentlyModeModel *object = [HMFrequentlyModeModel object:rs];
        
        [rs close];
        
        return object;
    }
    [rs close];
    
    return nil;
}

+ (NSMutableArray *)allCurtainModel:(HMDevice *)device {
    NSMutableArray * array = [NSMutableArray array];
    
    NSString *sql = [NSString stringWithFormat:@"select * from frequentlyMode where deviceId = '%@' and uid = '%@'",device.deviceId,device.uid];
    
    FMResultSet * rs = [[HMDatabaseManager shareDatabase] executeQuery:sql];
    
    while([rs next])
    {
        HMFrequentlyModeModel *object = [HMFrequentlyModeModel object:rs];
        
        [array addObject:object];
        
    }
    [rs close];
    
    [array sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        HMFrequentlyModeModel * model1 = (HMFrequentlyModeModel *)obj1;
        HMFrequentlyModeModel * model2 = (HMFrequentlyModeModel *)obj2;
        
        return model1.modeId > model2.modeId;
    }];
    
    return array;
}
+ (HMFrequentlyModeModel *)frequentlyModeModelForDevice:(HMDevice*)device andValue:(CGFloat)value {
    NSString *sql = [NSString stringWithFormat:@"select * from frequentlyMode where deviceId = '%@' and uid = '%@' and value1 = %.lf",device.deviceId,device.uid,value];
    
    FMResultSet * rs = [[HMDatabaseManager shareDatabase] executeQuery:sql];
    HMFrequentlyModeModel *object = nil;
    if ([rs next])
    {
       object = [HMFrequentlyModeModel object:rs];
        
        
    }
    [rs close];
    
    
    return object;

}
- (BOOL)insertObject
{
    NSString * sql = [NSString stringWithFormat:@"insert into frequentlyMode (frequentlyModeId,uid,modeId,name,deviceId,bindOrder,value1,value2,value3,value4,createTime,updateTime,delFlag) values('%@','%@',%d,'%@','%@','%@',%d,%d,%d,%d,'%@','%@',%d)",self.frequentlyModeId,self.uid,self.modeId,self.name,self.deviceId,self.bindOrder,self.value1,self.value2,self.value3,self.value4,self.createTime,self.updateTime,self.delFlag];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

- (BOOL)updateObject
{
    return [self insertObject];
}

- (BOOL)deleteObject
{
    NSString * sql = [NSString stringWithFormat:@"delete from frequentlyMode where frequentlyModeId = '%@'",self.frequentlyModeId];
    BOOL result = [[HMDatabaseManager shareDatabase] executeUpdate:sql];
    return result;
}

/**
 根据value1的百分比匹配模式
 */
+ (instancetype)curtainModelWithDevice:(HMDevice *)device action:(HMAction *)action
{
    HMFrequentlyModeModel *object = nil;
    
    NSString *sql = [NSString stringWithFormat:@"select * from frequentlyMode where deviceId = '%@' and uid = '%@' and value1 = %d order by modeId asc",device.deviceId,device.uid,action.value1];
    
    FMResultSet * rs = [[HMDatabaseManager shareDatabase] executeQuery:sql];
    
    if([rs next]){
        object = [HMFrequentlyModeModel object:rs];
    }
    [rs close];
    
    return object;
}
@end
