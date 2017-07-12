//
//  UIView+Animation.m
//  AnimationMy
//
//  Created by zgpeace on 11/07/2017.
//  Copyright © 2017 zgpeace. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)

- (void)moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option
{
    [UIView animateWithDuration:secs delay:0.0 options:option animations:^{
        self.frame = CGRectMake(destination.x, destination.y, self.frame.size.width, self.frame.size.height);
    } completion:nil];
}

- (void)downUnder:(float)secs option:(UIViewAnimationOptions)option
{
    [UIView animateWithDuration:secs delay:0.0 options:option animations:^{
        self.transform = CGAffineTransformRotate(self.transform, M_PI);
    } completion:nil];
}

- (void)addSubviewWithZoomInAnimation:(UIView *)view duration:(float)secs option:(UIViewAnimationOptions)option
{
    // first reduce the view to 1/100th of its original dimension
    CGAffineTransform trans = CGAffineTransformScale(view.transform, 0.01, 0.01);
    view.transform = trans; // do it instanly, no animation
    [self addSubview:view];
    // now return the view to normal dimension, animating this tranformation
    [UIView animateWithDuration:secs delay:0.0 options:option animations:^{
        view.transform = CGAffineTransformScale(view.transform, 100.0, 100.0);
    } completion:nil];
}

- (void)removeWithZoomOutAnimation:(float)secs option:(UIViewAnimationOptions)option
{
    [UIView animateWithDuration:secs delay:0.0 options:option animations:^{
        self.transform = CGAffineTransformScale(self.transform, 0.01, 0.01);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)addSubviewWithFadeAnimation:(UIView *)view duration:(float)secs option:(UIViewAnimationOptions)option
{
    view.alpha = 0.0;
    [self addSubview:view];
    [UIView animateWithDuration:secs delay:0.0 options:option animations:^{
        view.alpha = 1.0;
    } completion:nil];
}

- (void)removeWithSinkAnimation:(int)steps
{
    NSTimer *timer;
    if (steps > 0 && steps < 100) {
        self.tag = steps;
    } else {
        self.tag = 50;
    }
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(removeWithSinkAnimationRotateTimer:) userInfo:nil repeats:YES];
}

- (void)removeWithSinkAnimationRotateTimer:(NSTimer *)timer
{
    CGAffineTransform trans = CGAffineTransformRotate(CGAffineTransformScale(self.transform, 0.9, 0.9), 0.314);
    self.transform = trans;
    self.alpha = self.alpha * 0.98;
    self.tag = self.tag - 1;
    if (self.tag <= 0) {
        [timer invalidate];
        [self removeFromSuperview];
    }
}

@end






























