//
//  DTCubeView.m
//  DTTest
//
//  Created by Darktt on 13/3/28.
//  Copyright (c) 2013 Darktt. All rights reserved.
//

#import "DTCubeView.h"
#import <QuartzCore/QuartzCore.h>

#define RADIANS(deg) ((deg) * M_PI / 180.0f)

@interface DTCubeView (){
    UIView *_view1;
    UIView *_view2;
    
    NSTimeInterval _duration;
}

@end

@implementation DTCubeView

+ (id)cubeViewWithFrame:(CGRect)frame forView1:(UIView *)view1 andView2:(UIView *)view2
{
    return [self cubeViewWithFrame:frame forView1:view1 andView2:view2 duration:0.5f];
}

+ (id)cubeViewWithFrame:(CGRect)frame forView1:(UIView *)view1 andView2:(UIView *)view2 duration:(NSTimeInterval)duration
{
    DTCubeView *cubeView = [[[DTCubeView alloc] initWithFrame:frame forView1:view1 andView2:view2 duration:duration] autorelease];
    
    return cubeView;
}

- (id)initWithFrame:(CGRect)frame forView1:(UIView *)view1 andView2:(UIView *)view2 duration:(NSTimeInterval)duration
{
    self = [super initWithFrame:frame];
    if (self == nil) return nil;
    
    [self setBackgroundColor:[UIColor blackColor]];
    [self setClipsToBounds:YES];
    
    _view1 = view1;
    
    _view2 = view2;
    
    _duration = duration;
    
    [self addSubview:_view1];
    [self addSubview:_view2];
    [self sendSubviewToBack:_view2];
    
    return self;
}

- (void)dealloc
{
    [_view1 release];
    [_view2 release];
    
    [super dealloc];
}

#pragma mark - Setter And Getter Methods

- (void)setView1:(UIView *)view1
{
    if (_view1 != nil) {
        [_view1 removeFromSuperview];
    }
    
    _view1 = view1;
    [self addSubview:_view1];
}

- (void)setView2:(UIView *)view2
{
    if (_view2 != nil) {
        [_view2 removeFromSuperview];
    }
    
    _view2 = view2;
    [self addSubview:_view2];
}

- (UIView *)view1
{
    return _view1;
}

- (UIView *)view2
{
    return _view2;
}

#pragma mark - Slide Cube Methods

- (void)slideUP
{
//    [_view1 setCenter:self.center];
//    [_view2 setCenter:self.center];
    
    _view1.layer.anchorPointZ = 11.547f;
    _view1.layer.doubleSided = NO;
    _view1.layer.zPosition = 2;
    
    _view2.layer.anchorPointZ = 11.547f;
    _view2.layer.doubleSided = NO;
    _view2.layer.zPosition = 2;
    
    CATransform3D viewInStartTransform = CATransform3DMakeRotation(RADIANS(-120), 1.0, 0.0, 0.0);
    viewInStartTransform.m34 = -1.0 / 200.0;
    
    CATransform3D viewOutEndTransform = CATransform3DMakeRotation(RADIANS(120), 1.0, 0.0, 0.0);
    viewOutEndTransform.m34 = -1.0 / 200.0;
    
    _view1.layer.transform = CATransform3DIdentity;
    _view2.layer.transform = viewOutEndTransform;
    
    [UIView animateWithDuration:_duration
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         _view1.layer.transform = viewInStartTransform;
                         _view2.layer.transform = CATransform3DIdentity;
                     }
                     completion:nil];
}

- (void)slideDown
{
//    [_view1 setCenter:self.center];
//    [_view2 setCenter:self.center];
    
    _view1.layer.anchorPointZ = 11.547f;
    _view1.layer.doubleSided = NO;
    _view1.layer.zPosition = 2;
    
    _view2.layer.anchorPointZ = 11.547f;
    _view2.layer.doubleSided = NO;
    _view2.layer.zPosition = 2;
    
    CATransform3D viewInStartTransform = CATransform3DMakeRotation(RADIANS(-120), 1.0, 0.0, 0.0);
    viewInStartTransform.m34 = -1.0 / 200.0;
    
    CATransform3D viewOutEndTransform = CATransform3DMakeRotation(RADIANS(120), 1.0, 0.0, 0.0);
    viewOutEndTransform.m34 = -1.0 / 200.0;
    
    _view1.layer.transform = viewInStartTransform;
    _view2.layer.transform = CATransform3DIdentity;
    
    [UIView animateWithDuration:_duration
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         _view1.layer.transform = CATransform3DIdentity;
                         _view2.layer.transform = viewOutEndTransform;
                     }
                     completion:nil];
}

- (void)slideLeft
{
    [_view1 setCenter:self.center];
    [_view2 setCenter:CGPointMake(self.center.x - CGRectGetWidth(self.frame), self.center.y)];
    
    NSLog(@"View1 Frame:%@, View2 Frame:%@", NSStringFromCGRect(_view1.frame), NSStringFromCGRect(_view2.frame));
}

- (void)slideRight
{
    [_view1 setCenter:self.center];
    [_view2 setCenter:CGPointMake(self.center.x + CGRectGetWidth(self.frame), self.center.y)];
    
    NSLog(@"View1 Frame:%@, View2 Frame:%@", NSStringFromCGRect(_view1.frame), NSStringFromCGRect(_view2.frame));
}

@end
