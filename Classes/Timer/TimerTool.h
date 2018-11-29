//
//  TimerTool.h
//  hss
//
//  Created by FW on 2017/8/26.
//  Copyright © 2017年 FW. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TimerToolProtcol <NSObject>

- (void)timerCreateOnceWithCurrentTime:(CGFloat)currentTime;

@end

@interface TimerTool : NSObject

/**
 初始化定时工具

 @param interval 时间间隔
 @param isReverse 是否是倒计时 YES - 倒计时   NO - 正序
 @param totalTime 总时间  为0时一直循环
 @param delegate 代理
 @param run 是否启动
 @return 实例
 */
- (instancetype)initWithInterval:(CGFloat)interval reverse:(BOOL)isReverse totalTime:(CGFloat)totalTime delegate:(id <TimerToolProtcol>)delegate run:(BOOL)run;

/**
 暂停
 */
- (void)pauseTimer;

/**
 继续
 */
- (void)resumeTimer;

/**
 取消
 */
- (void)cancelTimer;


@end
