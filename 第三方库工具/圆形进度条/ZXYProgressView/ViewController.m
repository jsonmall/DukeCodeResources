//
//  ViewController.m
//  ProgressView
//
//  Created by Mars on 2017/11/29.
//  Copyright © 2017年 赵向禹. All rights reserved.
//

#import "ViewController.h"

#import "ZXYSectorProgress.h"
#import "ZXYBallProgress.h"
#import "ZXYCircleProgress.h"
#import "ZXYWaveProgress.h"
#import "ZXYGradientProgress.h"
#import "CircleLoader.h"

@interface ViewController ()
{
    /** 扇形进度 */
    ZXYSectorProgress *_sectorProgress;
    /** 圆形进度 */
    ZXYBallProgress *_ballProgress;
    /** 圆弧进度 */
    ZXYCircleProgress *_circleProgress;
    /** 波浪进度 */
    ZXYWaveProgress *_waveProgress;
    /** 渐变色圆弧进度 */
    ZXYGradientProgress *_gradientProgress;
    /**圆形带有动画进度条**/
    CircleLoader *_circleAnimationProgress;
    
    UISlider *_slider;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _sectorProgress = [[ZXYSectorProgress alloc] initWithFrame:CGRectMake(10, 100, 150, 150) progress:0];
    _sectorProgress.fillColor = [UIColor yellowColor];
    [self.view addSubview:_sectorProgress];
    
    _ballProgress = [[ZXYBallProgress alloc] initWithFrame:CGRectMake(215, 100, 150, 150) progress:0];
    _ballProgress.fillColor = [UIColor yellowColor];
    _ballProgress.strokeColor = [UIColor redColor];
    [self.view addSubview:_ballProgress];
    
    _circleProgress = [[ZXYCircleProgress alloc] initWithFrame:CGRectMake(10, 517, 150, 150) progress:0];
    _circleProgress.progressWidth = 10;
    _circleProgress.bottomColor = [UIColor redColor];
    _circleProgress.topColor = [UIColor cyanColor];
    
    _circleAnimationProgress = [[CircleLoader alloc] initWithFrame:CGRectMake(100, 200, 70, 70)];
    //设置轨道颜色
    _circleAnimationProgress.trackTintColor=[UIColor redColor];
    //设置进度条颜色
    _circleAnimationProgress.progressTintColor=[UIColor greenColor];
    //设置轨道宽度
    _circleAnimationProgress.lineWidth=5.0;
    //设置进度
    _circleAnimationProgress.progressValue=0.7;
    //设置是否转到 YES进度不用设置
    _circleAnimationProgress.animationing=YES;
    
    [self.view addSubview:_circleAnimationProgress];
    
    _waveProgress = [[ZXYWaveProgress alloc] initWithFrame:CGRectMake(215, 517, 150, 150) progress:0];
    _waveProgress.fillColor = [UIColor redColor];
    _waveProgress.strokeColor = [UIColor blackColor];
    [self.view addSubview:_waveProgress];
    
    _gradientProgress = [[ZXYGradientProgress alloc] initWithFrame:CGRectMake(0, 0, 150, 150) progress:0];
    _gradientProgress.center = self.view.center;
    _gradientProgress.bottomColor = [UIColor purpleColor];
    [self.view addSubview:_gradientProgress];
    
    _slider = [[UISlider alloc] initWithFrame:CGRectMake(20, 70, self.view.bounds.size.width - 40, 30)];
    _slider.minimumValue = 0;
    _slider.maximumValue = 1;
    _slider.value = 0;
    [_slider addTarget:self action:@selector(changeProgress:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_slider];
}

- (void)changeProgress:(UISlider *)sender {
    
    _sectorProgress.progress = (sender.value - sender.minimumValue) / (sender.maximumValue - sender.minimumValue);
    _ballProgress.progress = (sender.value - sender.minimumValue) / (sender.maximumValue - sender.minimumValue);
    _circleProgress.progress = (sender.value - sender.minimumValue) / (sender.maximumValue - sender.minimumValue);
    _waveProgress.progress = (sender.value - sender.minimumValue) / (sender.maximumValue - sender.minimumValue);
    _gradientProgress.progress = (sender.value - sender.minimumValue) / (sender.maximumValue - sender.minimumValue);
    
    _circleAnimationProgress.progressValue=(sender.value - sender.minimumValue) / (sender.maximumValue - sender.minimumValue);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
