//
//  ViewController.m
//  map
//
//  Created by yjin on 16/8/24.
//  Copyright © 2016年 pchen. All rights reserved.
//

#import "ViewController.h"
#import "CPMapNavigation.h"
#import "CustomToast.h"
#import "ABLocation.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:@"导航" forState:UIControlStateNormal];
    
    button.frame = CGRectMake(0, 100, 100, 100);
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:button];
    
    
    
}

- (void)buttonClick:(UIButton *)button {
    
    // 传的百度坐标系: 高度坐标系可以使用 CLLocation+ABLocationTransform 转换
    CLLocation *originLocaiton  = [ABLocation sharedLocation].lastLocation;
    if ([ABLocation isCanLocation] == NO || originLocaiton == nil) {
        
        [CustomToast showDialog:@"开启定位或者等待定位成功"];
        return;
    }
   
    [[CPMapNavigation sharedMapNavigation] clickGotoMapWithDestinationName:@"目标" DestinationCoordinate:CLLocationCoordinate2DMake(39.99517568, 114.41148289) originCoordinate: originLocaiton.coordinate];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
