//
// Auto Create JsonModel File
// DTINfoModelDataModel.h
//
//

#import <Foundation/Foundation.h>
#import "DTINfoModelCoachModel.h"
#import "MenuListItemModel.h"
#import "HotMenuListItemModel.h"



@interface DTINfoModelDataModel : NSObject

@property (nonatomic, strong) NSString  *welfare_info;
@property (nonatomic, strong) NSNumber  *userid;
@property (nonatomic, copy  ) NSString  *token;

@property (nonatomic, strong) DTINfoModelCoachModel  *coach;

@property (nonatomic, strong) NSArray<MenuListItemModel >  *menuList;

@property (nonatomic, strong) NSArray<HotMenuListItemModel >  *hotMenuList;

@end