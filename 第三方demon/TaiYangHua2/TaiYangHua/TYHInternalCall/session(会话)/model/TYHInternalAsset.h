//
//  TYHInternalAsset.h
//  TaiYangHua
//
//  Created by Lc on 16/2/19.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

@interface TYHInternalAsset : NSObject
@property (strong, nonatomic) PHAsset *asset;
@property (assign, nonatomic, getter=isSelected) BOOL selected;
@property (assign, nonatomic) CGSize assetGridThumbnailSize;
@property (assign, nonatomic) NSInteger dataLength;
@property (copy, nonatomic) NSString *bytes;

+ (instancetype)internalAssetWith:(PHAsset *)asset;

@end
