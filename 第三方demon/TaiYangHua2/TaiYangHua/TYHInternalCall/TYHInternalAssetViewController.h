//
//  TYHInternalAssetViewController.h
//  TaiYangHua
//
//  Created by Lc on 16/2/16.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>
#define maxSelectedImageCount 5

@class TYHInternalAssetViewController;

@protocol TYHInternalAssetViewControllerDelegate <NSObject>

@required

// 点击返回后执行
- (void)internalAssetViewController:(TYHInternalAssetViewController *)internalAssetViewController selectedItemsInAssetViewController:(NSMutableArray *)selectedItems;

// 点击发送按钮
- (void)internalAssetViewController:(TYHInternalAssetViewController *)internalAssetViewController didClickSenderButton:(NSMutableArray *)selectedItems;

@end

@interface TYHInternalAssetViewController : UIViewController

/**
 *  显示第一张图片的索引
 */
@property (assign, nonatomic) NSInteger index;

/**
 *  显示图片的数组
 */
@property (strong, nonatomic) NSMutableArray *assetArray;

/**
 *  选中图片的数组
 */
@property (strong, nonatomic) NSMutableArray *selectedItems;

@property (weak, nonatomic) id<TYHInternalAssetViewControllerDelegate> delegate;

@end
