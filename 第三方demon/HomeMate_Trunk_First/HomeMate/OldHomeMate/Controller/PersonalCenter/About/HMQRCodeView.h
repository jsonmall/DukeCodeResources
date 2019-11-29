//
//  HMQRCodeView.h
//  HomeMate
//
//  Created by orvibo on 15/11/18.
//  Copyright © 2015年 Air. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMQRCodeView : UIView

+(void)showInWindowCompletion:(void(^)(void))completionBlock;

@end
