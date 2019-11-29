//
//  TLCSharedConstants.h
//  CutTheVerlet
//
//  Created by Tammy Coron on 4/11/14.
//  Copyright (c) 2014 Tammy Coron. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(int,LayerNum)
{
    LayerBackGround,
    LayerForeGround,
    LayerCrocodile,
    LayerRope,
    LayerPrize,
};
typedef NS_OPTIONS(int, EntityCateGory)
{
    EntityCateGoryCrocodile = 1<<0,
    EntityCateGoryRopeAttachment =1<<1,
    //左移以为扩大两倍，1<<2 = 1*2*2=4
    EntityCageGoryRope = 1<<2,
    EntityCategoryPrize =1 <<3,
    EntityCategoryGround =1<<4,

};
//写上extern是为了让你去做一些清楚的声明，就是让你在这声明了变量并且能在任何地方设置变量的值
extern NSString *const kImageNameForRopeHolder;

extern NSString *const kImageNameForRopeTexture;



extern NSString *const kImageNameForCrocodileBaseImage;

extern NSString *const kImageNameForCrocodileMouthOpen;

extern NSString *const kImageNameForCrocodileMouthClosed;



extern NSString *const kSoundFileNameForCutAction;

extern NSString *const kSoundFileNameForSplashAction;

extern NSString *const kSoundFileNameForBiteAction;



extern NSString *const kSoundFileNameForBackgroundMusic;



extern NSString *const kImageNameForPrize;

extern NSString *const kNodeNameForPrize;
@interface TLCSharedConstants : NSObject





@end
