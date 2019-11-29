//
//  DelayButton.m
//  ABB
//
//  Created by orvibo on 14-3-26.
//  Copyright (c) 2014年 orvibo. All rights reserved.
//

#import "DelayButton.h"

#define kDelayTime 0.5

@implementation DelayButton
@synthesize delayEnable;
@synthesize delayTime;

-(void)initVariable
{
    delayEnable = YES;
    delayTime = kDelayTime;
    self.exclusiveTouch=YES;
}

-(id)init
{
    self = [super init];
    if (self) {
        // Initialization code
        [self initVariable];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initVariable];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if (self) {
        
        [self initVariable];
    }
    return self;
}

-(void)delayEnableButton:(UIButton *)sender
{
    sender.userInteractionEnabled = NO;
	NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:delayTime
                                                      target:self
                                                    selector:@selector(setButtonEnable:)
                                                    userInfo:sender
                                                     repeats:NO];
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
}

-(void)setButtonEnable:(NSTimer *)timer
{
    UIButton *sender = timer.userInfo;
    sender.userInteractionEnabled = YES;
    [timer invalidate];
}


-(void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    [super sendAction:action to:target forEvent:event];
    
    if (self.delayEnable) {
        
        [self delayEnableButton:self];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
