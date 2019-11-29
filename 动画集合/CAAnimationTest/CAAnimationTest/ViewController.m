//
//  ViewController.m
//  CAAnimationTest
//
//  Created by JCH on 16/1/9.
//  Copyright © 2016年 JCH. All rights reserved.
//

#import "ViewController.h"
#import "CHTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSInteger totalNumber;
}

@property (retain, nonatomic) IBOutlet UIImageView *shippingCartView;
@property (strong, nonatomic) IBOutlet UILabel *numberLabel;


@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *bottomView;


@property (strong, nonatomic) NSMutableArray<CALayer *> *redLayers;

@end

@implementation ViewController

- (NSMutableArray<CALayer *> *)redLayers {
    if (!_redLayers) {
        _redLayers = [NSMutableArray array];
    }
    return _redLayers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    [self updateNumberLabel];
    
    
}

- (void)initCHLayerFromPoint:(CGPoint)startPoint toPoint:(CGPoint)endPoint {

    CALayer *chLayer = [[CALayer alloc] init];
    [self.redLayers addObject:chLayer];

    chLayer.frame = CGRectMake(startPoint.x, startPoint.y, 15, 15);
    chLayer.cornerRadius = CGRectGetWidth(chLayer.frame)/2.f;
    chLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:chLayer];
    
    CAKeyframeAnimation *CHAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, startPoint.x, startPoint.y);
    CGPathAddQuadCurveToPoint(path, NULL, endPoint.x, startPoint.y, endPoint.x, endPoint.y);
    
    CHAnimation.path = path;
    CHAnimation.removedOnCompletion = NO;
    CHAnimation.fillMode = kCAFillModeBoth;
    CHAnimation.duration = 0.5;
    CHAnimation.delegate = self;
    
    [chLayer addAnimation:CHAnimation forKey:nil];
  
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self.redLayers[0] removeFromSuperlayer];
    [self.redLayers removeObjectAtIndex:0];

}

- (void)updateNumberLabel {
    NSString *totalNumberStr = [NSString stringWithFormat:@"共 %zd 件商品",totalNumber];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalNumberStr];
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16.f] range:NSMakeRange(1, attributedStr.length - 4)];
    self.numberLabel.attributedText = attributedStr;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CHTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    
    [cell setPlusTapHandle:^(CGPoint position) {
        totalNumber++;
        [self updateNumberLabel];
        CGPoint startPoint = [self.view convertPoint:position fromView:self.tableView];
        CGPoint endPoint = [self.view convertPoint:self.shippingCartView.center fromView:self.bottomView];
        [self initCHLayerFromPoint:startPoint toPoint:endPoint];
        //model add to array
        
    }];
    
    [cell setMinusTapHandle:^() {
            totalNumber--;
            [self updateNumberLabel];
        //model remove from array
    }];
    
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
