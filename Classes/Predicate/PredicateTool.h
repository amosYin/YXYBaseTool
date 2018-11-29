//
//  PredicateTool.h
//  hss
//
//  Created by FW on 2017/8/26.
//  Copyright © 2017年 FW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PredicateTool : NSObject

// 正则校验手机号
+ (BOOL)predicatePhone:(NSString *)phoneStr;

// 正则校验邮箱
+ (BOOL)predicateEmail:(NSString *)emailStr;

// 正则校验纯数字
+ (BOOL)predicateNumber:(NSString *)numberStr;

// 正则校验非汉字
+ (BOOL)predicateChinese:(NSString *)chineseStr;

// 正则校验身份证号
+ (BOOL)predicateIdCard:(NSString *)idCardStr;

// 验证URL
+ (BOOL)urlValidation:(NSString *)string;
@end
