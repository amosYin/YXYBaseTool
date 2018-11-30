//
//  NSObject+HUD.m
//  ShouBa
//
//  Created by FW on 2017/3/27.
//  Copyright © 2017年 silence. All rights reserved.
//

#import "NSObject+HUD.h"

@implementation NSObject (HUD)

#pragma mark - 加载进度动画
- (void)progressViewStart
{
    
}
#pragma mark - 添加在不同位置的进度动画
- (void)progressViewStartInView:(UIView *)view
{
    
}
#pragma mark - 移除进度动画
- (void)progressViewFinish
{
    
}

- (void)showAlertWithTitle:(NSString *)title{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:nil delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles: nil];
    [alertView show];
}

@end
