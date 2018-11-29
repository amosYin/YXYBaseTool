//
//  PredicateTool.m
//  hss
//
//  Created by FW on 2017/8/26.
//  Copyright © 2017年 FW. All rights reserved.
//

#import "PredicateTool.h"

@implementation PredicateTool

// 正则校验手机号
+ (BOOL)predicatePhone:(NSString *)phoneStr
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,147,150,151,152,157,158,159,182,183,184,187,188
     * 联通：130,131,132,145,152,155,156,185,186
     * 电信：133,1349,153,180,181,189
     */
    NSString * MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|7[036-8]|8[0-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,147,150,151,152,157,158,159,182,183,184,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|47|5[017-9]|78|8[23478])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|45|5[256]|76|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|7[07]|8[019])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:phoneStr] == YES)
        || ([regextestcm evaluateWithObject:phoneStr] == YES)
        || ([regextestct evaluateWithObject:phoneStr] == YES)
        || ([regextestcu evaluateWithObject:phoneStr] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

// 正则校验邮箱
+ (BOOL)predicateEmail:(NSString *)emailStr
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    if (![emailTest evaluateWithObject:emailStr] && emailStr.length != 0) {
        return NO;
    }
    return YES;
}

// 正则校验纯数字
+ (BOOL)predicateNumber:(NSString *)numberStr
{
    NSString * number = @"[0-9]";
    NSPredicate *regextestnumber = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", number];
    if (![regextestnumber evaluateWithObject:numberStr] && numberStr.length != 0) {
        return NO;
    }
    return YES;
}

// 正则校验非汉字
+ (BOOL)predicateChinese:(NSString *)chineseStr
{
    NSString * number = @"[0-9]|[a-z]|[A-Z]";
    NSPredicate *regextestnumber = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", number];
    if (![regextestnumber evaluateWithObject:chineseStr] && chineseStr.length != 0) {
        return NO;
    }
    return YES;
}

// 正则校验身份证号
+ (BOOL)predicateIdCard:(NSString *)idCardStr
{
    NSString * code = @"[0-9]*(x|X)?";
    NSPredicate *regextestIdCard = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", code];
    if (![regextestIdCard evaluateWithObject:idCardStr]) {
        return NO;
    }
    return YES;
}

/**
 * 网址正则验证 1或者2使用哪个都可以
 *
 *  @param string 要验证的字符串
 *
 *  @return 返回值类型为BOOL
 */
+ (BOOL)urlValidation:(NSString *)string {
    NSError *error;
    // 正则1
    NSString *regulaStr =@"\\bhttps?://[a-zA-Z0-9\\-.]+(?::(\\d+))?(?:(?:/[a-zA-Z0-9\\-._?,'+\\&%$=~*!():@\\\\]*)+)?";
    // 正则2
    regulaStr =@"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr
                                                                          options:NSRegularExpressionCaseInsensitive
                                                                            error:&error];
    NSArray *arrayOfAllMatches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    
    for (NSTextCheckingResult *match in arrayOfAllMatches){
        NSString* substringForMatch = [string substringWithRange:match.range];
        NSLog(@"匹配");
        return YES;
    }
    return NO;
}
@end
