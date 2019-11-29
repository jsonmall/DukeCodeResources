//
//  PlayMusic.h
//  小熊避雨
//
//  Created by 郭鹏 on 16/5/18.
//  Copyright © 2016年 郭鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface PlayMusic : NSObject

+(PlayMusic*)shareInstance;
-(void)playBackGorundMusic;
-(void)switchMusic;
@end
