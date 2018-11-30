//
//  NSObject+HUD.h
//  ShouBa
//
//  Created by FW on 2017/3/27.
//  Copyright © 2017年 silence. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface NSObject (HUD)<MBProgressHUDDelegate>

#pragma mark - 吐司提示 font 不传时默认为15号常规字体
- (void)showHudText:(NSString *)text afterDelay:(NSTimeInterval)delay font:(UIFont *)font;

#pragma mark - 展示吐司提示信息 (默认提示两秒)
- (void)showHudText:(NSString *)text;

#pragma mark - 吐司提示不隐藏
- (void)showHudNoHidden:(NSString *)text;
- (void)hiddenHud;

#pragma mark - 展示菊花进度 （转菊花时一般是等待操作，所以禁止用户操作）
- (void)showActivityWithText:(NSString *)text;

#pragma mark - 隐藏菊花进度
- (void)hidenActivity;

#pragma mark - 展示带图片的提示框
- (void)showHudTextImage:(NSString *)imageName text:(NSString *)text;

#pragma mark - 加载进度动画
- (void)progressViewStart;

#pragma mark - 添加在不同位置的进度动画
- (void)progressViewStartInView:(UIView *)view;

#pragma mark - 移除进度动画
- (void)progressViewFinish;

#pragma mark - alert提示
- (void)showAlertWithTitle:(NSString *)title;


@end
