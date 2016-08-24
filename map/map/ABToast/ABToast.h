//
//  ABToast.h
//  AB_RealTimeBus
//
//  Created by Liu Zhao on 15/1/12.
//  Copyright (c) 2015年 Liu Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABToast : UIView

+ (void)showDialog:(NSString *)content;

+ (void)showDialog:(NSString *)content initView:(UIView *)view;

+ (void)showNetworkError;

+ (void)showDialog:(NSString *)content initView:(UIView *)view WithTime:(CGFloat)seconds;

@end
