//
//  DTScrollNumberCoutView.m
//  GPSrollView
//
//  Created by 郭大侠 on 2018/4/19.
//  Copyright © 2018年 郭大侠. All rights reserved.
//

#import "DTScrollNumberCoutView.h"

@interface DTScrollNumberCoutView ()
{
    NSMutableArray *_numbersText;       // 保存拆分出来的数字
    NSMutableArray *_scrollLayers;
    NSMutableArray *_scrollLabels;      // 保存label
}

@end

@implementation DTScrollNumberCoutView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.backGroudimageView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
}


#pragma mark - Public Methods

- (void)reloadView
{
    [self prepareAnimations];
}

- (void)startAnimation
{
    [self createAnimations];
}

- (void)stopAnimation
{
    for (CALayer *layer in _scrollLayers) {
        [layer removeAnimationForKey:@"MSNumberScrollAnimatedView"];
    }
}

#pragma mark - Private Methods

- (void)commonInit
{
    _backGroudimageView = [[UIImageView alloc]init];
    _backGroudimageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:_backGroudimageView];
    
    self.duration = 1.5;
    self.durationOffset = 0.2;
    self.density = 5;
    self.minLength = 0;
    self.isAscending = NO;
    
    self.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    self.textColor = [UIColor blackColor];
    
    _numbersText = [NSMutableArray array];
    _scrollLayers = [NSMutableArray array];
    _scrollLabels = [NSMutableArray array];
}

- (void)prepareAnimations
{
    // 先删除旧数据
    for (CALayer *layer in _scrollLayers) {
        [layer removeFromSuperlayer];
    }
    [_numbersText removeAllObjects];
    [_scrollLayers removeAllObjects];
    [_scrollLabels removeAllObjects];
    
    // 配置新的数据和UI
    [self configNumbersText];
    [self configScrollLayers];
}

- (void)configNumbersText
{
    NSString *numberStr = [_number stringValue];
    // 如果 number 长度小于 最小长度就补0
    // 这里需要注意一下 minLength 和 length 都是NSUInteger类型 如果相减得负数的话会有问题
    for (NSInteger i = 0; i < (NSInteger)self.minLength - (NSInteger)numberStr.length; i++) {
        [_numbersText addObject:@"0"];
    }
    // 取出 number 各位数
    for (NSUInteger i = 0; i < numberStr.length; i++) {
        [_numbersText addObject:[numberStr substringWithRange:NSMakeRange(i, 1)]];
    }
}

- (void)configScrollLayers
{
    // 平均分配宽度
//    CGFloat width = (CGRectGetWidth(self.frame)-40) / _numbersText.count;
    CGFloat width = 40;
    CGFloat height = 80;
    // 创建和配置 scrollLayer
    for (NSUInteger i = 0; i < _numbersText.count; i++) {
        CAScrollLayer *layer = [CAScrollLayer layer];
        layer.frame = CGRectMake(i*width+i*2, 2, width, height);
        [_scrollLayers addObject:layer];
        [self.layer addSublayer:layer];
        
        NSString *numberText = _numbersText[i];
        [self configScrollLayer:layer numberText:numberText];
    }
}

- (void)configScrollLayer:(CAScrollLayer *)layer numberText:(NSString *)numberText
{
    NSInteger number = [numberText integerValue];
    NSMutableArray *scrollNumbers = [NSMutableArray array];
    // 添加要滚动的数字
    for (NSInteger i = 0; i < self.density + 1; i++) {
        [scrollNumbers addObject:[NSString stringWithFormat:@"%u", (unsigned int)((number+i) % 10)]];
    }
    [scrollNumbers addObject:numberText];
    // 创建 scrollLayer 的内容，数字降序排序
    // 修改局部变量的值需要使用 __block 修饰符
    __block CGFloat height = 0;
    [scrollNumbers enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(NSString *text, NSUInteger idx, BOOL * _Nonnull stop) {
        DTDigitNumberView *label = [self createLabel:text];
        label.frame = CGRectMake(0, height, CGRectGetWidth(layer.frame), CGRectGetHeight(layer.frame));
        [layer addSublayer:label.layer];
        // 保存label，防止对象被回收
        [_scrollLabels addObject:label];
        // 累加高度
        height = CGRectGetMaxY(label.frame);
    }];
}

- ( DTDigitNumberView *)createLabel:(NSString *)text
{
//    UILabel *label = [[UILabel alloc] init];
//    label.backgroundColor = [UIColor greenColor];
//    label.textColor = self.textColor;
//    label.font = self.font;
//    label.textAlignment = NSTextAlignmentCenter;
//    label.text = text;
//    return label;
    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.layer.cornerRadius = 2;
//    btn.clipsToBounds = YES;
//    btn.titleLabel.font = self.font;
//    [btn setBackgroundImage:self.numberBackImage forState:UIControlStateNormal];
//    [btn setTitle:text forState:UIControlStateNormal];
//    [btn setTitleColor:self.textColor forState:UIControlStateNormal];
//    return btn;
    
    
    DTDigitNumberView *numberView = [[DTDigitNumberView alloc]init];
    numberView.numbermaskImageView.image = self.numbermaskBackImage;
    numberView.numberbgImageView.image = self.numberBackImage;
    numberView.numberLable.textColor = self.textColor;
    numberView.numberLable.font = self.font;
    numberView.numberLable.textAlignment = NSTextAlignmentCenter;
    numberView.numberLable.text = text;
    return numberView;

}

- (void)createAnimations
{
    // 第一个 layer 的动画持续时间
    NSTimeInterval duration = self.duration - ((_numbersText.count-1) * self.durationOffset);
    for (CALayer *layer in _scrollLayers) {
        
        CGFloat maxY = [[layer.sublayers lastObject] frame].origin.y;
        // keyPath 是 sublayerTransform ，因为动画应用于 layer 的 subLayer。
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"sublayerTransform.translation.y"];
        animation.duration = duration;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        // 滚动方向
        if (self.isAscending) {
            animation.fromValue = @0;
            animation.toValue = [NSNumber numberWithFloat:-maxY];
        } else {
            animation.fromValue = [NSNumber numberWithFloat:-maxY];
            animation.toValue = @0;
        }
        // 添加动画
        [layer addAnimation:animation forKey:@"MSNumberScrollAnimatedView"];
        // 累加动画持续时间
        duration += self.durationOffset;
    }
}

#pragma mark - Setter

- (void)setNumber:(NSNumber *)number
{
    _number = number;
    // 准备动画
    [self prepareAnimations];
}

@end

/**单个数字视图**/

@implementation DTDigitNumberView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self numbermaskImageView];
        [self numberbgImageView];
        [self numberLable];
    }
    return self;
}



- (void)layoutSubviews
{
    [super layoutSubviews];
     self.numberLable.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
     self.numberbgImageView.frame = CGRectMake(2, 8, self.bounds.size.width-4, self.bounds.size.height-16);
     self.numbermaskImageView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
}

-(UILabel *)numberLable
{
    if (!_numberLable) {
        _numberLable = [[UILabel alloc]init];
        [self addSubview:_numberLable];
    } return _numberLable;
    
}

-(UIImageView *)numbermaskImageView
{
    if (!_numbermaskImageView) {
        _numbermaskImageView = [[UIImageView alloc]init];
        _numbermaskImageView.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:_numbermaskImageView];
    } return _numbermaskImageView;
}

-(UIImageView *)numberbgImageView
{
    if (!_numberbgImageView) {
        _numberbgImageView = [[UIImageView alloc]init];
         _numberbgImageView.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:_numberbgImageView];
    } return _numberbgImageView;
}


@end



















