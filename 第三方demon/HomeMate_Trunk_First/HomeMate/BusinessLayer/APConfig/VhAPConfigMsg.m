//
//  VhAPConfigMsg.m
//  ViHomeProLib
//
//  Created by liqiang on 15/8/6.
//  Copyright (c) 2015年 Air. All rights reserved.
//

#import "VhAPConfigMsg.h"
#import "VhAPConfig.h"

@implementation VhAPConfigMsg

- (void)doTimeout {

    [[VhAPConfig defaultConfig] onTimeout:self];
}

/**
 *	@brief	设置超时时间
 *  @param  N/A
 *  @return  N/A
 */
-(void)startTimeout
{
    self.startTimestamp = [NSDate date];
}

/**
 *	@brief	设置超时起始时间
 *
 *	@param 	startDate 	起始时间
 */
-(NSDate*)getStartTime
{
    return _startTimestamp;
}
/**
 *	@brief	获得设定的超时时间
 *
 *	@return	超时时间
 */
-(NSInteger)getTimeoutTime
{
    return self.timeoutSeconds;
}
@end
