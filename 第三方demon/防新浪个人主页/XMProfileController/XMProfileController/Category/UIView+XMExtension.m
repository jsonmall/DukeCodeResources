

#import "UIView+XMExtension.h"

@implementation UIView (XMExtension)


#pragma mark - xm
- (void)setXm_x:(CGFloat)xm_x
{
    CGRect frame = self.frame;
    frame.origin.x = xm_x;
    self.frame = frame;
}

- (CGFloat)xm_x
{
    return self.frame.origin.x;
}

- (void)setXm_y:(CGFloat)xm_y
{
    CGRect frame = self.frame;
    frame.origin.y = xm_y;
    self.frame = frame;
}

- (CGFloat)xm_y
{
    return self.frame.origin.y;
}

- (void)setXm_centerX:(CGFloat)xm_centerX
{
    CGPoint center = self.center;
    center.x = xm_centerX;
    self.center = center;
}

- (CGFloat)xm_centerX
{
    return self.center.x;
}

- (void)setXm_centerY:(CGFloat)xm_centerY
{
    CGPoint center = self.center;
    center.y = xm_centerY;
    self.center = center;
}

- (CGFloat)xm_centerY
{
    return self.center.y;
}

- (void)setXm_size:(CGSize)xm_size
{
    CGRect frame = self.frame;
    frame.size = xm_size;
    self.frame = frame;
}

- (CGSize)xm_size
{
    return self.frame.size;
}

- (void)setXm_origin:(CGPoint)xm_origin
{
    CGRect frame = self.frame;
    frame.origin = xm_origin;
    self.frame = frame;
}

- (CGPoint)xm_origin
{
    return self.frame.origin;
}

- (void)setXm_width:(CGFloat)xm_width
{
    CGRect frame = self.frame;
    frame.size.width = xm_width;
    self.frame = frame;
}

- (CGFloat)xm_width
{
    return self.frame.size.width;
}

- (void)setXm_height:(CGFloat)xm_height
{
    CGRect frame = self.frame;
    frame.size.height = xm_height;
    self.frame = frame;
}

- (CGFloat)xm_height
{
    return self.frame.size.height;
}

@end
