//
//  LLZStatusBarAlertView.h
//  JPUSH
//
//  Created by 柳麟喆 on 2018/1/2.
//  Copyright © 2018年 lzLiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLZStatusBarAlertView : UIView

/**
 transition time of showing
 */
@property(nonatomic,readonly,assign)CGFloat showTransitTime;
/**
 transition time of dismissing
 */
@property(nonatomic,readonly,assign)CGFloat dismissTransitTime;

+ (LLZStatusBarAlertView *)sharedView;

- (void)showWithStatus :(NSString *)status;

- (void)showSuccessWithStatus: (NSString *)status;

- (void)showErrorWithStatus: (NSString *)status;

- (void)showWithStatus :(NSString *)status delay:(CGFloat)delay;

- (void)showSuccessWithStatus: (NSString *)status delay:(CGFloat)delay;

- (void)showErrorWithStatus: (NSString *)status delay:(CGFloat)delay;

/**
 firstly init

 @param status description of this view
 @param textColor textcolor
 @param barColor backgroundcolor of status bar
 @param delay delaying time
 */
- (void)showWithStatus: (NSString *)status textColor:(UIColor *)textColor barColor:(UIColor *)barColor delay:(CGFloat)delay;

- (void)setShowTransitTime:(CGFloat)showTransitTime;

- (void)setDismissTransitTime:(CGFloat)dismissTransitTime;

/**
 set transition time of showing and dismissing

 @param showTransitTime transition time of showing
 @param dismissTransitTime transition time of dismissing
 */
- (void)setShowTransitTime:(CGFloat)showTransitTime dismissTransitTime: (CGFloat)dismissTransitTime;

- (void)dismiss;

@end
