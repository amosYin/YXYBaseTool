//
//  My_Define.h
//  dt5
//
//  Created by 崔明明 on 16/10/12.
//  Copyright © 2016年 com.xdy.zddt. All rights reserved.
//

#ifndef My_Define_h
#define My_Define_h

#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define HexRGBWithAlpha(rgbValue,alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]

#define ColoClear [UIColor colorWithRed:1 green:1 blue:1 alpha:0]
#define ColoWhite [UIColor colorWithRed:1 green:1 blue:1 alpha:1]
#define ColoBlack [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0f]
#define kGaryColor HexRGB(0x587595)
#define kIphone5Width(w)  (((w) * kScreenWidth) / 320.0f)
#define kIphone5Height(h) (((h) * kScreenHeight) / 568.0f)
#define kIphone6Width(w)  (((w) * kScreenWidth) / 375.0f)
#define kIphone6Height(h) (iPhoneX ? h : (((h) * kScreenHeight) / 667.0f))

#define kGrayFont [UIFont systemFontOfSize:14]

/**提示*/
#define YBAlertShow(messageText,buttonName) \
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:(messageText) \
delegate:nil cancelButtonTitle:(buttonName) otherButtonTitles: nil];\
[alert show];

/**判断字符串是否为空*/
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
/**判断数组是否为空*/
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
/**判断字典是否为空*/
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
/**判断是否是空对象*/
#define kObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

#define kSystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]
/**一些缩写*/
#define kApplication        [UIApplication sharedApplication]
#define kKeyWindow          [UIApplication sharedApplication].keyWindow
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]
/**APP版本号*/
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;



#ifdef DEBUG
#ifndef DLog
#   define DLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#endif
#ifndef ELog
#   define ELog(err) {if(err) DLog(@"%@", err)}
#endif
#else
#ifndef DLog
#   define DLog(...)
#endif
#ifndef ELog
#   define ELog(err)
#endif
#endif

/**手机型号*/
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750,1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242,2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125,2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define kNavigationHeight       (kNavigationBarHeight + kStatusBarHeight)

#define kNavigationBarHeight    44.0f

#define kStatusBarHeight   [[UIApplication sharedApplication] statusBarFrame].size.height

#define kTabbarHeight  ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)

#define kHomeBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?34:0)

#define kScreenScal     kScreenWidth/375.00




#endif /* My_Define_h */
