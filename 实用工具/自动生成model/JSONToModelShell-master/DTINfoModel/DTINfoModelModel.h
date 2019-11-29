//
// Auto Create JsonModel File
// DTINfoModelModel.h
//
//

#import <Foundation/Foundation.h>
#import "DTINfoModelDataModel.h"



@interface DTINfoModelModel : NSObject

@property (nonatomic, copy  ) NSString  *message;
@property (nonatomic, strong) NSNumber  *code;

@property (nonatomic, strong) DTINfoModelDataModel  *data;

@end