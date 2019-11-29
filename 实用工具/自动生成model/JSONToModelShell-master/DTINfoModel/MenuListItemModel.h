//
// Auto Create JsonModel File
// MenuListItemModel.h
//
//

#import <Foundation/Foundation.h>

@protocol MenuListItemModel

@end



@interface MenuListItemModel : NSObject

@property (nonatomic, strong) NSNumber  *status;
@property (nonatomic, copy  ) NSString  *name;
@property (nonatomic, copy  ) NSString  *title;
@property (nonatomic, copy  ) NSString  *url;
@property (nonatomic, copy  ) NSString  *tips;
@property (nonatomic, copy  ) NSString  *icon;

@end