//
//  JLXXBaseWebController.m
//  CatchDoll
//
//  Created by Apple on 2017/11/5.
//  Copyright © 2017年 JLXX. All rights reserved.
//

#import "JLXXBaseWebController.h"


@interface JLXXBaseWebController ()<WKNavigationDelegate>


@property (nonatomic , strong) UIProgressView *progressView;
@end

@implementation JLXXBaseWebController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, iPhoneX?44:20, kScreenWidth, kScreenHeight)];
    [self.view addSubview:self.webView];
    self.webView.scrollView.backgroundColor = [UIColor clearColor];
    self.webView.navigationDelegate = self;
    if (@available(iOS 11.0, *)) {
        self.webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlString]]];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    self.progressView.progress = 0.1;
    
}

- (void)setUrlString:(NSString *)urlString{
    if ([urlString hasPrefix:@"http"]) {
        _urlString = urlString;
    }else{
        _urlString = [NSString stringWithFormat:@"http://%@", urlString];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        //不要让进度条倒着走...有时候goback会出现这种情况
        if ([change[@"new"] floatValue] < [change[@"old"] floatValue]) {
            return;
        }
        self.progressView.progress = [change[@"new"] floatValue];
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}


// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    self.progressView.hidden = NO;
}

// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    self.progressView.hidden = YES;
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    self.progressView.hidden = YES;
}

-(void)dealloc{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];;
}

-(UIProgressView *)progressView{
    if(!_progressView){
        _progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 2)];
        _progressView.progressTintColor = [UIColor greenColor];
        _progressView.trackTintColor = [UIColor whiteColor];
        CGAffineTransform transform = CGAffineTransformMakeScale(1.0f, 2.0f);
        self.progressView.transform = transform;//设定宽高
        [self.webView addSubview:_progressView];
    }
    return _progressView;
}



@end
