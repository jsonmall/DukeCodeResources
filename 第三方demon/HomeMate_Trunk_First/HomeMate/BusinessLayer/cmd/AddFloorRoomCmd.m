//
//  AddFloorRoomCmd.m
//  Vihome
//
//  Created by Air on 15-3-6.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "AddFloorRoomCmd.h"

@implementation AddTestFloorCmd
-(NSDictionary *)payload
{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/floor.plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    [sendDic setObject:array forKey:@"floorList"];
    
    return sendDic;
}
@end

@implementation AddFloorRoomCmd
-(VIHOME_CMD)cmd
{
    return VIHOME_CMD_AFR;
}

-(NSDictionary *)payload
{
    NSMutableArray *tempArray = [NSMutableArray array];
    
    for (NSDictionary *dic in self.floorArray) {
        
        NSMutableArray *array = [NSMutableArray array];
        NSArray *roomNameList = [dic objectForKey:@"roomNameList"];
        for (HMRoom *room in roomNameList) {
    
            [array addObject:@{@"roomName": room.roomName,@"roomType":@(room.roomType)}];
        }
        NSMutableDictionary * tempDic = [NSMutableDictionary dictionaryWithDictionary:dic];
        [tempDic setObject:array forKey:@"roomNameList"];
        
        [tempArray addObject:tempDic];
    }
    
    [sendDic setObject:tempArray forKey:@"floorList"];
    
    return sendDic;
}

//-(void)payloaddfd
//{
//    @[@{@"FloorName":@"楼层1"
//        ,@"roomNameList": @[NSLocalizedString(@"Living Room", nil)
//                            ,[NSString stringWithFormat:@"%@1",NSLocalizedString(@"Living Room", nil)]
//                            ,[NSString stringWithFormat:@"%@2",NSLocalizedString(@"Living Room", nil)]
//                            ,[NSString stringWithFormat:@"%@3",NSLocalizedString(@"Living Room", nil)]
//                            ,NSLocalizedString(@"Study", nil)
//                            ,NSLocalizedString(@"Dining room", nil)
//                            ,NSLocalizedString(@"Bathroom", nil)
//                            ,NSLocalizedString(@"Balcony", nil)
//                            ,NSLocalizedString(@"Living Room", nil)]}
//      ,@{@"FloorName":@"楼层2"
//         ,@"roomNameList": @[NSLocalizedString(@"Living Room", nil)
//                             ,[NSString stringWithFormat:@"%@1",NSLocalizedString(@"Living Room", nil)]
//                             ,[NSString stringWithFormat:@"%@2",NSLocalizedString(@"Living Room", nil)]
//                             ,[NSString stringWithFormat:@"%@3",NSLocalizedString(@"Living Room", nil)]
//                             ,NSLocalizedString(@"Study", nil)
//                             ,NSLocalizedString(@"Dining room", nil)
//                             ,NSLocalizedString(@"Bathroom", nil)
//                             ,NSLocalizedString(@"Balcony", nil)
//                             ,NSLocalizedString(@"Living Room", nil)]}];
//}
@end
