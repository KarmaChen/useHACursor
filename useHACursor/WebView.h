//
//  WebView.h
//  useHACursor
//
//  Created by Karma on 16/5/26.
//  Copyright © 2016年 陈昆涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NJKWebViewProgressView.h"
#import "NJKWebViewProgress.h"

@interface WebView : UIWebView
@property (nonatomic,strong) NJKWebViewProgressView *_progressView;
@property (nonatomic,strong) NJKWebViewProgress *_progressProxy;
@end
