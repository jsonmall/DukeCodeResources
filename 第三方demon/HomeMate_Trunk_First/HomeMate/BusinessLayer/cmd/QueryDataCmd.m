//
//  QueryData.m
//  Vihome
//
//  Created by Ned on 1/26/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "QueryDataCmd.h"

@implementation QueryDataCmd

-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_QD;
}

-(NSDictionary *)payload
{
    [sendDic setObject:[NSNumber numberWithInt:self.LastUpdateTime] forKey:@"lastUpdateTime"];
    [sendDic setObject:self.TableName forKey:@"tableName"];
    [sendDic setObject:[NSNumber numberWithInteger:self.PageIndex] forKey:@"pageIndex"];
    [sendDic setObject:self.dataType forKey:@"dataType"];
    return sendDic;
}

@end
