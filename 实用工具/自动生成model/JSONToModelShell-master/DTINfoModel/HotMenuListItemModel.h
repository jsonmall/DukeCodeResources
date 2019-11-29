//
// Auto Create JsonModel File
// HotMenuListItemModel.h
//
//

#import <Foundation/Foundation.h>

@protocol HotMenuListItemModel

@end



@interface HotMenuListItemModel : NSObject

@property (nonatomic, strong) NSNumber  *mtype;
@property (nonatomic, strong) NSNumber  *show_badge;
@property (nonatomic, copy  ) NSString  *icon;
@property (nonatomic, copy  ) NSString  *url;
@property (nonatomic, copy  ) NSString  *title;

@end