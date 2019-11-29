//
//  TYHChartMessage.h
//  TaiYangHua
//
//  Created by Vieene on 15/12/25.
//  Copyright © 2015年 hhly. All rights reserved.
//

typedef enum {
    kMessageFrom=0,
    kMessageTo = 1
}TYHMsgFromToType;

typedef NS_ENUM(NSInteger, MessageType) {
    MessageTypeText = 0,    //0-文本；
    MessageTypeImage   = 1, //1-图片；
    MessageTypefile  = 2,   //2-文件；
    MessageTypeVoice = 3,   //3-语音；
    MessageTypeRealTimeVoice =4,//4-实时语音；
    MessageTypeJudge = 5,   //5-推送评价或评价确认；
    MessageTypeTips = 6,    //6-提示语；
    MessageTypeEnd = 7,     //7-结束语；
};
//上传状态
typedef NS_ENUM(NSInteger, uploadPrgoress) {
    uploadPrgoressUndo = 1,//初始值
    uploadPrgoressdoing   = 2,//正在上传
    uploadPrgoressdone  = 3,//上传完成
    uploadPrgoressError = 4,//上传失败，错误
};
@class TYHChartMessage;
#import <Foundation/Foundation.h>
#import "TYHChartCell.h"
@protocol ChartMessageModelDelegate<NSObject>

//发送上传实时反馈进度
- (void)uploadImageProgress:(CGFloat)progress msgModel:(TYHChartMessage *)msgModel;

//发送上传反馈结果
- (void)uploadProgress:(uploadPrgoress)uploadStage msgModel:(TYHChartMessage *)msgModel;

@end
@interface TYHChartMessage : NSObject <ChartCellModelDelegate>
@property (nonatomic,assign) TYHMsgFromToType fromToType;/**消息方向**/
@property (nonatomic,weak) id<ChartMessageModelDelegate> progressDelegate;
@property (nonatomic, copy) NSString *icon;// 建议将这个属性放在访客信息模型中去
@property (nonatomic, copy) NSDictionary *dict;
@property (nonatomic,assign) uploadPrgoress uploadStage;//记录上传状态
@property (nonatomic,copy) NSString *sendImageUrl;//发送图片的本地路径
@property (nonatomic, copy) NSString *sessionId;/** 会话id */
@property (nonatomic, copy) NSString *inputText;
@property (nonatomic,copy) NSString * chatId;//消息编号
@property (nonatomic,copy) NSString * tm;//消息发送时间
@property (nonatomic,assign) MessageType  itp;//消息类型
@property (nonatomic,copy) NSString * wds;//会话文字内容，录音时长
@property (nonatomic,copy) NSString * src;//媒体资源地址	上传文件、音频时使用
@property (nonatomic,copy) NSString * state;//消息状态	0-未处理；1-已处理；
@property (nonatomic,copy) NSString *curcs;
@property (nonatomic,assign) CGFloat progress;//记录cell上传图片进度
@property (nonatomic,copy) NSString *voiceLocalPath;//音频文件缓存后的本地实际路径
@property (nonatomic,assign) int DatabaseIndex;/**在数据库中的编号**/
- (void)sendImage;
@end
