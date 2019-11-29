//
//  HMMatchTableView.h
//  HomeMate
//
//  Created by orvibo on 16/1/21.
//  Copyright © 2016年 Air. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MatchBlock)(NSString *text);

@interface HMMatchTableView : UIView

-(void)loadData:(NSArray *)dataArray block:(MatchBlock)block;

@end
