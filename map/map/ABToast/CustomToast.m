//
//  CustomToast.m
//  customIBus
//
//  Created by aibang on 15/5/18.
//  Copyright (c) 2015年 aibang. All rights reserved.
//

#import "CustomToast.h"
#import "ABToast.h"
#import "MBProgressHUD.h"

@implementation CustomToast


+ (void)showDialog:(NSString *)string {
    

    [CustomToast showToastWithInfo:string];
    
}

+ (void)showDialog:(NSString *)string time:(CGFloat)seconds {
    
    UIWindow *window =  [[UIApplication sharedApplication].delegate window];
    
    
    [ABToast showDialog:string initView:window WithTime:seconds];
    
}


+ (void)showToastWithInfo:(NSString *)info{
    
    NSRange range = [info rangeOfString:@"|||"];

    if (range.length > 0) {

        info = [info  stringByReplacingOccurrencesOfString:@"|||" withString:@"\n"];
    }
    
    
    [ABToast showDialog:info];
}

+ (void)showNetworkError {
    [self showToastWithInfo:@"网络不给力，请检查设置后再试"];
}

static bool isShowing = NO;
+ (void)showWating {

    if (isShowing == YES) {
        return;
    }
    
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    //[MBProgressHUD showHUDAddedTo:window animated:YES];
    
    [self showWatingInView:window];
    
    isShowing = YES;

}

+ (void)showWatingInView:(UIView *)view {
    [self showWatingInView:view duration:0 str:nil];
}

+ (void)showWatingInView:(UIView *)view duration:(CGFloat) duration{
    [self showWatingInView:view duration:duration str:nil];
}

+ (void)showWatingInView:(UIView *)view str:(NSString *)str{
    [self showWatingInView:view duration:0 str:str];
}

+ (void)showWatingInView:(UIView *)view duration:(CGFloat)duration str:(NSString *)str
{
    if (view == nil) {
        //ABLog(@"view == nil 不显示提示框");
        return;
    }
//    if (isShowing == YES) {
//        NSLog(@"ww=========wwwwwwwwwwww========oooo");
//        return;
//    }
    isShowing = YES;
    
    if ([view viewWithTag:10021]) {
        return;
    }
    
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];

    hud.mode=MBProgressHUDModeIndeterminate;
    //hud.opacity=0;
    hud.tag=10021;
    [view addSubview:hud];
    [hud show:YES];
    //传入时间大于0,会在此时间后隐藏
    if (duration) {
        [hud hide:YES afterDelay:duration];
    }
}

+ (void)showToastWithString:(NSString *)string InView:(UIView *)view {
    
    if (view == nil) {
        return;
    }
    
    if (isShowing == YES) {
        return;
    }
    isShowing = YES;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = string;
    
    
}

+ (void)showWatingWithString:(NSString *)string {
    
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    [self showToastWithString:string InView:window];
    
}

+ (void)hideWating {
    
    if (isShowing == NO) {
        
        return ;
    }
    isShowing = NO;
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    
    [MBProgressHUD  hideHUDForView:window animated:NO];
}

+ (void)hideWatingInView:(UIView *)view {
    if (view == nil) {
        return;
    }
    isShowing = NO;
    [MBProgressHUD  hideHUDForView:view animated:NO];
}



@end
