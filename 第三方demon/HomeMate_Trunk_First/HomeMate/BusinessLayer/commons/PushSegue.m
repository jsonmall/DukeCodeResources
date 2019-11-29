//
//  PushSegue.m
//  Vihome
//
//  Created by Air on 15-3-20.
//  Copyright (c) 2015年 orvibo. All rights reserved.
//

#import "PushSegue.h"

@implementation PushSegue

- (void)perform
{
    UIViewController *source = self.sourceViewController;
    [source.navigationController pushViewController:self.destinationViewController animated:YES];
}
@end
