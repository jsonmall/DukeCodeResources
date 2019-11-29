//
//  TYHVisitorLeaveMsgInfo.h
//  TaiYangHua
//
//  Created by HHLY on 15/12/24.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYHVisitorLeaveMsgInfo : NSObject
/** 留言主键值 */
@property (nonatomic, assign) NSInteger msgId;
/** 留言编号 */
@property (nonatomic, assign) NSInteger msgNumber;
/** 留言处理状态，1－已处理，0－未处理 */
@property (nonatomic, assign) NSInteger handleState;
/** 留言者的姓名 */
@property (nonatomic, copy  ) NSString  *visitorName;
/** 留言时间 */
@property (nonatomic, copy  ) NSString  *createTime;
/** 访客地址 */
@property (nonatomic, copy  ) NSString  *visitorAddress;
/** 访客手机号码 */
@property (nonatomic, copy  ) NSString  *visitorTelephone;
/** 访客邮箱 */
@property (nonatomic, copy  ) NSString  *visitorEmail;
/** 访客固话 */
@property (nonatomic, copy  ) NSString  *visitorPhone;
/** 留言内容 */
@property (nonatomic, copy  ) NSString  *msgContent;
/** 客服备注 */
@property (nonatomic, copy  ) NSString  *remark;
/** 客服处理时间 */
@property (nonatomic, copy  ) NSString  *handleTime;
/** 处理留言的客服id  */
@property (nonatomic, copy  ) NSString  *customId;
/** 处理留言的客服名字  */
@property (nonatomic, copy  ) NSString  *customName;
/** 主题名称 */
@property (nonatomic, copy  ) NSString  *topicName;
/** 创建的时间戳，用于比较创建先后顺序 */
@property (nonatomic, assign) NSInteger stampTime;

@end
