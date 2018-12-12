//
//  JLXXBaseWebController.h
//  CatchDoll
//
//  Created by Apple on 2017/11/5.
//  Copyright © 2017年 JLXX. All rights reserved.
//

#import "BaseViewController.h"
#import <WebKit/WebKit.h>

@interface JLXXBaseWebController : BaseViewController

@property (nonatomic , strong) NSString *urlString;
@property (nonatomic , strong) WKWebView *webVieww;
@end
