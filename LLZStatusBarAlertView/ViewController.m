//
//  ViewController.m
//  LLZStatusBarAlertView
//
//  Created by 柳麟喆 on 2018/1/3.
//  Copyright © 2018年 lzLiu. All rights reserved.
//

#import "ViewController.h"
#import "LLZStatusBarAlertView.h"
#import "AViewController.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"LLZStatusBarAlertView";
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
    [self.view addSubview:cancelBtn];
    
    //跳转 按钮
    UIButton *nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 450, 70, 30)];
    nextBtn.backgroundColor = [UIColor blueColor];
    [nextBtn setTitle:@"跳转" forState:UIControlStateNormal];
    nextBtn.titleLabel.textColor = [UIColor redColor];
    nextBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [nextBtn addTarget:self action:@selector(showAVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
}

- (void)showView{
    NSLog(@"*******show*******");
//    [[LLZStatusBarAlertView sharedView]showWithStatus:@"hello world" textColor:[UIColor whiteColor] barColor:[UIColor greenColor] delay:3];
//    [[LLZStatusBarAlertView sharedView]setDismissTransitTime:0.7];
//    [[LLZStatusBarAlertView sharedView]setShowTransitTime:2.0];
//    [[LLZStatusBarAlertView sharedView]showWithStatus:@"HELLO WORLD!"];
    [[LLZStatusBarAlertView sharedView]showWithStatus:@"123" delay:4];
}

- (void)cancelView{
    NSLog(@"*******cancel*******");
    [[LLZStatusBarAlertView sharedView]dismiss];
}

- (void)showAVC{
    AViewController *AVC = [[AViewController alloc]init];
//    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:AVC];
    [self.navigationController pushViewController:AVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
