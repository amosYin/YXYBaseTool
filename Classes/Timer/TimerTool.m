//
//  TimerTool.m
//  hss
//
//  Created by FW on 2017/8/26.
//  Copyright © 2017年 FW. All rights reserved.
//

#import "TimerTool.h"

@interface TimerTool ()

@property (nonatomic , assign) CGFloat currentTime;

@property (nonatomic , weak) id <TimerToolProtcol> delegate;

@property (nonatomic , copy) dispatch_source_t timer;

@property (nonatomic , assign) BOOL isRun;

@end

@implementation TimerTool

- (instancetype)initWithInterval:(CGFloat)interval reverse:(BOOL)isReverse totalTime:(CGFloat)totalTime delegate:(id <TimerToolProtcol>)delegate run:(BOOL)run
{
    self = [super init];
    if (self) {
        _delegate = delegate;
        self.isRun = run;
        [self createTimerWithInterval:interval reverse:isReverse totalTime:totalTime];
    }
    return self;
}

- (void)createTimerWithInterval:(CGFloat)interval reverse:(BOOL)isReverse totalTime:(CGFloat)totalTime
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    if (totalTime <= 0) {
        _currentTime = 1;
    }
    else
    {
        if (isReverse) {
            _currentTime = totalTime;
        }
        else
        {
            _currentTime = 0;
        }
    }
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, DISPATCH_TIME_NOW, interval * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(_timer, ^{
        if (((!isReverse) ? _currentTime >= totalTime : _currentTime <= 0) && totalTime != 0) {
            dispatch_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                if ([_delegate respondsToSelector:@selector(timerCreateOnceWithCurrentTime:)]) {
                    [_delegate timerCreateOnceWithCurrentTime:_currentTime];
                }
            });
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                if ([_delegate respondsToSelector:@selector(timerCreateOnceWithCurrentTime:)]) {
                    [_delegate timerCreateOnceWithCurrentTime:_currentTime];
                }
            });
            if (totalTime > 0) {
                if (isReverse) {
                    _currentTime -= interval;
                }
                else
                {
                    _currentTime += interval;
                }
            }
        }
    });
    if (self.isRun) {
        dispatch_resume(_timer);
    }
}

/**
 暂停
 */
- (void)pauseTimer
{
    if (_timer && self.isRun) {
        dispatch_suspend(_timer);
        self.isRun = NO;
    }
}

/**
 继续
 */
- (void)resumeTimer
{
    if (_timer && !self.isRun) {
        dispatch_resume(_timer);
        self.isRun = YES;
    }
}

- (void)cancelTimer
{
    dispatch_cancel(_timer);
    _timer = nil;
    self.isRun = NO;
}

@end
