//
//  DTCubeView.h
//  DTTest
//
//  Created by Darktt on 13/3/28.
//  Copyright (c) 2013 Darktt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTCubeView : UIView

#if __has_feature(objc_instancetype)
#define DTInstancetype instancetype
#else
#define DTInstancetype id
#endif

@property (nonatomic, retain) UIView *view1;
@property (nonatomic, retain) UIView *view2;

+ (DTInstancetype)cubeViewWithFrame:(CGRect)frame forView1:(UIView *)view1 andView2:(UIView *)view2;
+ (DTInstancetype)cubeViewWithFrame:(CGRect)frame forView1:(UIView *)view1 andView2:(UIView *)view2 duration:(NSTimeInterval)duration;

- (void)slideUP;
- (void)slideDown;
//- (void)slideLeft;
//- (void)slideRight;

@end
