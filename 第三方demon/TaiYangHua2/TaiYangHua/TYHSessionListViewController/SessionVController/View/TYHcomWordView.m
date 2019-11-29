//
//  TYHcomWordView.m
//  TaiYangHua
//
//  Created by Vieene on 16/4/18.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "TYHcomWordView.h"
#import "TYHseachrVC.h"

@interface TYHcomWordView ()<UIGestureRecognizerDelegate>
@property (nonatomic,strong) TYHseachrVC *seachVC;

@end
@implementation TYHcomWordView
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}
- (void)setUp
{
    _seachVC = [TYHseachrVC shardView];
    [self addSubview:_seachVC];
    self.backgroundColor = [[UIColor colorWithWhite:0.392 alpha:1.000] colorWithAlphaComponent:0.5];
    self.tag = 999;
    _seachVC.frame = CGRectMake(SCREEN_W * 0.15, 0, SCREEN_W * 0.85, SCREEN_H - 64 - 44);
    _seachVC.backgroundColor = colorf0fGrey;
    self.frame = CGRectMake(SCREEN_W, 64, SCREEN_W, SCREEN_H - 64 - 44);

    UITapGestureRecognizer *tap =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disMissSearView)];
    [self addGestureRecognizer:tap];
    tap.delegate = self;

}
- (void)setModelArray:(NSArray *)modelArray
{
    _modelArray = modelArray;
    _seachVC.modelArray = modelArray;
}

#pragma mark -UIGestureRecognizerDelegate
-(BOOL)gestureRecognizer:(UIGestureRecognizer*)gestureRecognizer shouldReceiveTouch:(UITouch*)touch {
    
    if ([touch.view isKindOfClass:[UIView class]] && touch.view.tag == 999) {
        [self endEditing:YES];
        return YES;
    }
    if ([touch.view isKindOfClass:[UILabel class]]) {
        if (_touchBlock) {
            _touchBlock(touch.view);
        }
    }
    if ([touch.view isKindOfClass:[UILabel class]] && touch.view.tag == 888) {
        if (_touchBlock) {
            _touchBlock(touch.view);
        }
    }
    [self endEditing:YES];
    return NO;
}

- (void)disMissSearView
{

    [UIView animateWithDuration:0.2 animations:^{
        self.frame = CGRectMake(SCREEN_W, 64, SCREEN_W, SCREEN_H - 64 - 44);
    }];
    if (self.closeCommwordblock) {
        _closeCommwordblock();
    }
    
}
- (void)open
{
    [UIView animateWithDuration:0.2 animations:^{
        self.frame = CGRectMake(0, 64, SCREEN_W, SCREEN_H - 64 - 44);
    }];
}
@end
