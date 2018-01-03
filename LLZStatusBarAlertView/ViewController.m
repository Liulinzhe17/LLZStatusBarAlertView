//
//  ViewController.m
//  LLZStatusBarAlertView
//
//  Created by 柳麟喆 on 2018/1/3.
//  Copyright © 2018年 lzLiu. All rights reserved.
//

#import "ViewController.h"
#import "LLZStatusBarAlertView.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //show 按钮
    UIButton *showBtn = [[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH/2)-30, (SCREEN_HEIGHT/2)-15, 60, 30)];
    showBtn.backgroundColor = [UIColor blueColor];
    [showBtn setTitle:@"show" forState:UIControlStateNormal];
    showBtn.titleLabel.textColor = [UIColor redColor];
    showBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [showBtn addTarget:self action:@selector(showView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showBtn];
    //cancel 按钮
    UIButton *cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 400, 70, 30)];
    cancelBtn.backgroundColor = [UIColor blueColor];
    [cancelBtn setTitle:@"cancel" forState:UIControlStateNormal];
    cancelBtn.titleLabel.textColor = [UIColor redColor];
    cancelBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [cancelBtn addTarget:self action:@selector(cancelView) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:cancelBtn];
}

- (void)showView{
    NSLog(@"*******show*******");
//    [[LLZStatusBarAlertView sharedView]showWithStatus:@"hello world" textColor:[UIColor whiteColor] barColor:[UIColor greenColor] delay:3];
    [[LLZStatusBarAlertView sharedView]showWithStatus:@"HELLO WORLD!"];
    [[LLZStatusBarAlertView sharedView]setShowTransitTime:1.0 dismissTransitTime:1.0];
}

- (void)cancelView{
    NSLog(@"*******cancel*******");
    [[LLZStatusBarAlertView sharedView]dismiss];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
