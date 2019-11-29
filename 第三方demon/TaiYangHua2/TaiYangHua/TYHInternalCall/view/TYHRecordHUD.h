//
//  TYHRecordHUD.h
//  TaiYangHua
//
//  Created by Lc on 16/4/6.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYHRecordHUD : UIView

/**
 *  显示录音指示器
 */
+ (void)showStartRecord;
+ (void)showEndRecord;
+ (void)showDragExitRecord;
+ (void)showDragEnterRecord;
@end
