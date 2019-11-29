//
//  TYHAudioPlayTool.h
//  TaiYangHua
//
//  Created by Lc on 16/1/25.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TYHInternalSession;

@interface TYHAudioPlayTool : NSObject

+(void)playWithMessage:(TYHInternalSession *)internalSession msgLabel:(UILabel *)msgLabel receiver:(BOOL)receiver;

@end
