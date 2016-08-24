//
//  ABAnimationUtils.m
//  AB_RealTimeBus
//
//  Created by aibang on 15/1/14.
//  Copyright (c) 2015年 Liu Zhao. All rights reserved.
//

#import "ABAnimationUtils.h"

@implementation ABAnimationUtils

+ (void)shakeAnimationWith:(UIView *)viewToShake
{
    CGFloat t = 2.0;
    CGAffineTransform translateRight  = CGAffineTransformTranslate(CGAffineTransformIdentity, t, -t);
    CGAffineTransform translateLeft = CGAffineTransformTranslate(CGAffineTransformIdentity, -t, t);
    viewToShake.transform = translateLeft;
    
    [UIView animateWithDuration:0.07 delay:0.0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:20.0];
        viewToShake.transform = translateRight;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                viewToShake.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                [viewToShake removeFromSuperview];
            }];
        }
    }];
}

+ (void)shakeAnimationWith2:(UIView *)viewToShake
{
    [UIView animateWithDuration:.15
                     animations:^{
                         viewToShake.layer.anchorPoint = CGPointMake(0, 1);
                         [viewToShake setTransform:CGAffineTransformMakeRotation(0.25)];
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:.15
                                          animations:^{
                                              [viewToShake setTransform:CGAffineTransformMakeRotation(-0.25)];
                                          } completion:^(BOOL finished) {
                                              [self shakeAnimationWith2:viewToShake];
                                          }];
                     }];
}

+ (void)shakeAnimationWith3:(UIView *)viewToShake
{
    [UIView animateWithDuration:.1
                     animations:^{
                         [viewToShake setTransform:CGAffineTransformMakeRotation(0.35)];
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:.1
                                          animations:^{
                                              [viewToShake setTransform:CGAffineTransformMakeRotation(-0.35)];
                                          } completion:^(BOOL finished) {
                                              [self shakeAnimationWith3:viewToShake];
                                          }];
                     }];
}

@end
