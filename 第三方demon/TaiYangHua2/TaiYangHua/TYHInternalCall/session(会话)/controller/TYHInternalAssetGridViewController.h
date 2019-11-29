//
//  TYHInternalAssetGridViewController.h
//  TaiYangHua
//
//  Created by Lc on 16/2/15.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TYHInternalAssetGridViewController;
@protocol TYHInternalAssetGridViewControllerDelegate <NSObject>

@required
// 点击发送按钮
- (void)internalAssetGridViewController:(TYHInternalAssetGridViewController *)internalAssetGridViewController didSenderImages:(NSMutableArray *)imageArray;

@end
@interface TYHInternalAssetGridViewController : UIViewController
@property (strong, nonatomic) NSMutableArray *allPhotos;
@property (weak, nonatomic) id<TYHInternalAssetGridViewControllerDelegate> delegate;
@end
