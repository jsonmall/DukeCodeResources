//
//  DBModel.h
//  Vihome
//
//  Created by Ned on 1/16/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "MJExtension.h"


@protocol OrderProtocol

@required

@property (nonatomic, strong)NSString *         bindOrder;

@property (nonatomic, assign)int                value1;

@property (nonatomic, assign)int                value2;

@property (nonatomic, assign)int                value3;

@property (nonatomic, assign)int                value4;

@end


@protocol SceneEditProtocol <OrderProtocol>
//新增的
//@property (nonatomic,assign)BOOL *                selectedone;
@optional

@property (nonatomic, strong)NSString *          sceneBindId;       // 情景绑定
@property (nonatomic, strong)NSString *          linkageOutputId;   // 联动output

+ (instancetype)deviceObject:(FMResultSet *)rs;

// 情景编辑设备时使用
+ (instancetype)bindObject:(FMResultSet *)rs;

- (id)copy;

@required

@property (nonatomic, strong) NSString *        uid;
@property (nonatomic, assign)int                delayTime;
@property (nonatomic, strong)NSString *         deviceId;

@property (nonatomic, strong)NSString *         deviceName;
@property (nonatomic, strong)NSString *         floorRoom;
@property (nonatomic, strong)NSString *         roomId;
@property (nonatomic, assign)int                deviceType;

@property (nonatomic, assign) BOOL              selected;

@property (nonatomic, assign,readonly) BOOL     changed;




@end


@protocol DBProtocol

@required

/**
 *  从数据库查询出记录结果后生成对象
 *
 *  @param set 记录集
 *
 *  @return 实例对象
 */
+ (instancetype)object:(FMResultSet *)rs;

/**
 *  从网络获取json数据后生成对象
 *
 *  @param dic 字典
 *
 *  @return 实例对象
 */
+ (instancetype)objectFromDictionary:(NSDictionary *)dic;

/**
 *  根据网关 uid 和 表记录的主键来查找对应的记录，返回个实例对象
 *
 *  @param UID      zigbee 网关uid 或 wifi设备自己的uid
 *  @param recordID
 *
 *  @return
 */
+ (instancetype)objectFromUID:(NSString *)UID recordID:(NSString *)recordID;

/**
 *  建表
 *
 *  @return 操作结果
 */
+ (BOOL)createTable;

/**
 *  创建内建有关联的触发器
 *
 *  @return
 */
+ (BOOL)createTrigger;

- (BOOL)insertObject;

- (BOOL)updateObject;

- (BOOL)deleteObject;

- (NSDictionary *)dictionaryFromObject;

+ (NSString *)tableName;

@end

@interface HMBaseModel : NSObject<DBProtocol>

@property (nonatomic, strong) NSString *             uid;
//@property (nonatomic, strong) NSString *             userId;
@property (nonatomic, strong) NSString *             updateTime;
@property (nonatomic, strong) NSString *             createTime;
/**
 *  删除标志
 */
@property (nonatomic, assign)int                delFlag;

@property (nonatomic, assign)sqlite3 *sqlite;

@end
