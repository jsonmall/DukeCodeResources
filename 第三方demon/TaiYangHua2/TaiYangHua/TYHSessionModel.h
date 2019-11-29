//
//  TYHSessionModel.h
//  TaiYangHua
//
//  Created by Vieene on 15/12/22.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import <Foundation/Foundation.h>
/*visitorCode	访客编号
ip	访客ip
area	访客地区
unReadAmount	未读消息总数	总数需要app计算
lastMessageContent	最后一条访客消息
waittingTime	等待时间	单位秒，查询后需要app手工时间累加
st	会话状态	0-未受理；1-已受理；2-转接；3-已阻止；4-等待分配；5-排队中；6-结束；
sessionId	会话ID
 
 */
@interface TYHSessionModel : NSObject

@property (nonatomic,copy)NSString * area;
@property (nonatomic,copy)NSString * ip;
@property (nonatomic,copy)NSString * lastMessageContent;
@property (nonatomic,copy)NSString * sessionId;
@property (nonatomic,copy)NSString * st;
@property (nonatomic,copy)NSString * visitorCode;
@property (nonatomic,copy)NSString * visitorName;
@property (nonatomic,copy)NSString * waittingTime;
@property (nonatomic,copy)NSString * unReadAmount;
@property (nonatomic,assign) BOOL isCliked;
// 会话有没有被转接
@property (nonatomic, assign) BOOL isTranslationning;

@end
