//
//  LLZStatusBarAlertView.m
//  JPUSH
//
//  Created by 柳麟喆 on 2018/1/2.
//  Copyright © 2018年 lzLiu. All rights reserved.
//

#import "LLZStatusBarAlertView.h"
#define isiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define STATUSBAR_HEIGHT [UIApplication sharedApplication].statusBarFrame.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define LLZRGBA(r, g, b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@interface LLZStatusBarAlertView()

@property(nonatomic,strong)UILabel *XMNotes;
@property(nonatomic,strong)UIWindow *overlayWindow;
@property(nonatomic,assign)BOOL isShowing;
@property(nonatomic,assign)BOOL isDismissing;
/**
 transition time of showing
 */
@property(nonatomic,readwrite,assign)CGFloat showTransitTime;
/**
 transition time of dismiss
 */
@property(nonatomic,readwrite,assign)CGFloat dismissTransitTime;

@property(nonatomic,strong)NSTimer *timer;

@end

@implementation LLZStatusBarAlertView

+ (LLZStatusBarAlertView *)sharedView {
    static dispatch_once_t once;
    static LLZStatusBarAlertView *sharedView;
    dispatch_once(&once,^{
        sharedView = [[LLZStatusBarAlertView alloc]initWithFrame:CGRectMake(0, -STATUSBAR_HEIGHT, SCREEN_WIDTH,STATUSBAR_HEIGHT)];
    });
    
    return sharedView;
}

#pragma mark - *******lazily loading*******
- (UIWindow *)overlayWindow {
    if(!_overlayWindow) {
        _overlayWindow = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, STATUSBAR_HEIGHT)];
        _overlayWindow.backgroundColor = [UIColor clearColor];
        _overlayWindow.userInteractionEnabled = NO;
        _overlayWindow.windowLevel = UIWindowLevelStatusBar;
    }
    return _overlayWindow;
}

- (UILabel *)XMNotes {
    if (!_XMNotes) {
        if (isiPhoneX) {
             _XMNotes = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH *1/6, 30, SCREEN_WIDTH *4/6, STATUSBAR_HEIGHT-30)];
            _XMNotes.font = [UIFont systemFontOfSize:13];
        }else{
            _XMNotes = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH *1/6, 0, SCREEN_WIDTH *4/6, STATUSBAR_HEIGHT)];
        }
        _XMNotes.textAlignment = NSTextAlignmentCenter;
    }
    return _XMNotes;
}

- (void)setShowTransitTime:(CGFloat)showTransitTime {
    _showTransitTime = showTransitTime;
}

- (void)setDismissTransitTime:(CGFloat)dismissTransitTime {
    _dismissTransitTime = dismissTransitTime;
}

- (void)setShowTransitTime:(CGFloat)showTransitTime dismissTransitTime: (CGFloat)dismissTransitTime{//default is 0.5
    self.dismissTransitTime = dismissTransitTime;
    self.showTransitTime = showTransitTime;
}
#pragma mark - *******init*******
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        [self addSubview:self.XMNotes];
        self.showTransitTime = 0.5;
        self.dismissTransitTime = 0.5;
    }
    return  self;
}

- (void)showWithStatus: (NSString *)status {
    return [[LLZStatusBarAlertView sharedView]showWithStatus:status delay:1];
}

- (void)showSuccessWithStatus: (NSString *)status {
    return [[LLZStatusBarAlertView sharedView]showSuccessWithStatus:status delay:1];
}

- (void)showErrorWithStatus: (NSString *)status {
    return [[LLZStatusBarAlertView sharedView]showErrorWithStatus:status delay:1];
}

- (void)showWithStatus: (NSString *)status delay:(CGFloat)delay{
    return [[LLZStatusBarAlertView sharedView]showWithStatus:status textColor:LLZRGBA(40, 40, 40, 1.0) barColor: LLZRGBA(40, 125, 185, 1.0) delay:delay];
}

- (void)showSuccessWithStatus: (NSString *)status delay:(CGFloat)delay {
    return [[LLZStatusBarAlertView sharedView]showWithStatus:status textColor:LLZRGBA(40, 40, 40, 1.0) barColor:[UIColor greenColor] delay:delay];
}

- (void)showErrorWithStatus: (NSString *)status delay:(CGFloat)delay {
    return [[LLZStatusBarAlertView sharedView]showWithStatus:status textColor:LLZRGBA(40, 40, 40, 1.0) barColor:[UIColor redColor] delay:delay];
}

- (void)showWithStatus: (NSString *)status textColor:(UIColor *)textColor barColor:(UIColor *)barColor delay:(CGFloat)delay {
    self.isDismissing = NO;
    if (self.isShowing) {
        NSLog(@"*******isshowing!!!*******");
        return;//视图正在显示
    }
    //视图开始显示
    self.isShowing = YES;
    //判断view是否已加入UIWindow
    if (!self.superview) {
        [self.overlayWindow addSubview:self];
    }
    [self.overlayWindow setHidden:NO];
    
    self.XMNotes.text = status;
    self.XMNotes.textColor = textColor;
    self.XMNotes.backgroundColor = barColor;
    self.backgroundColor = barColor;
    
    [UIView animateWithDuration:self.showTransitTime animations:^{
        [self setFrame:CGRectMake(0, 0, SCREEN_WIDTH, STATUSBAR_HEIGHT)];
    } completion:^(BOOL finished){
        self.timer = [NSTimer scheduledTimerWithTimeInterval:delay target:self selector:@selector(dismiss) userInfo:nil repeats:NO];
        [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
    }];
    
    [self setNeedsLayout];
}

- (void)dismiss{
    self.isShowing = NO;
    [self.timer invalidate];
    if (self.isDismissing) {
        NSLog(@"*******isdismissing!!*******");
        return;//视图正在消失
    }
    //视图开始消失
    self.isDismissing = YES;
    [UIView animateWithDuration:self.dismissTransitTime animations:^{
        [self setFrame:CGRectMake(0, -STATUSBAR_HEIGHT, SCREEN_WIDTH, STATUSBAR_HEIGHT)];
    } completion:^(BOOL finished){
        [self removeFromSuperview];
        self.overlayWindow = nil;
        self.isDismissing = NO;
    }];
}



@end
