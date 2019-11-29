//
//  VihomeAddressMap.h
//  Vihome
//
//  Created by Ned on 1/16/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "HMBaseModel.h"

@interface HMAddressMap : HMBaseModel

@property (nonatomic, assign)int            addressMapId;

@property (nonatomic, retain)NSString *     nwkAddr;
@property (nonatomic, retain)NSString *     extAddr;

@property (nonatomic, assign)int            capabilities;

@property (nonatomic, assign)int            offline;

@end
