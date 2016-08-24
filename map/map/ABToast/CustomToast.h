//
//  CustomToast.h
//  customIBus
//
//  Created by aibang on 15/5/18.
//  Copyright (c) 2015年 aibang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CustomToast : NSObject


+ (void)showToastWithString:(NSString *)string InView:(UIView *)view;

+ (void)showToastWithInfo:(NSString *)info;

+ (void)showNetworkError;

+ (void)showWating;

+ (void)hideWating;

+ (void)showWatingWithString:(NSString *)string;

+ (void)showDialog:(NSString *)string;

+ (void)showWatingInView:(UIView *)view ;

+ (void)showWatingInView:(UIView *)view duration:(CGFloat) duration;

+ (void)showWatingInView:(UIView *)view str:(NSString *)str;

+ (void)showWatingInView:(UIView *)view duration:(CGFloat)duration str:(NSString *)str;

+ (void)hideWatingInView:(UIView *)view;

+ (void)showDialog:(NSString *)string time:(CGFloat)seconds;
@end
