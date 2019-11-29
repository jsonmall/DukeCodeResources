//
//  ViewController.h
//  小熊避雨
//
//  Created by 郭鹏 on 16/5/13.
//  Copyright © 2016年 郭鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "homeScene.h"

@interface ViewController : UIViewController
@property (nonatomic,assign)BOOL isPlay;
@property (nonatomic,strong)NSString *playing;
-(void)switchMusic;
+(ViewController*)shareInstance;
@end

