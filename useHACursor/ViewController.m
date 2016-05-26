//
//  ViewController.m
//  useHACursor
//
//  Created by Karma on 16/5/26.
//  Copyright © 2016年 陈昆涛. All rights reserved.
//

#import "ViewController.h"
#import "HACursor.h"
#import "UIView+Extension.h"
#import "WebView.h"
@interface ViewController ()
@property (nonatomic,strong) NSArray *titles;
@property (nonatomic,strong) NSMutableArray *pageViews;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titles = @[@"网易",@"新浪",@"腾讯",@"苹果",@"搜狐",@"淘宝",@"京东",@"百度"];
    HACursor *cursor =[[HACursor alloc]init];
    cursor.frame=CGRectMake(0, 64, self.view.width, 45);
    cursor.titles=_titles;
    //显示每个子视图的内容
    cursor.pageViews=[self createPageViews];
    //设置滚动视图的高度
    cursor.rootScrollViewHeight=self.view.frame.size.height-109;
    //默认值为白色
    cursor.titleNormalColor=[UIColor whiteColor];
    cursor.titleSelectedColor=[UIColor yellowColor];
    //是否需要显示排序的按钮
    cursor.showSortbutton=YES;
    //默认的最小值是5，小于默认值的话按默认值设置
    //设置最小化的字体
    cursor.minFontSize = 10.0;
    //设置最大化的字体
    cursor.maxFontSize = 30.0;
    //设置是否需要渐变字体的大小
    cursor.isGraduallyChangFont = YES;
    //设置是否需要渐变字体的颜色
    cursor.isGraduallyChangColor = YES;
    [self.view addSubview:cursor];
}
//用webView展示
-(NSMutableArray*)createPageViews{
    NSMutableArray *pageViews = [NSMutableArray array];
    NSArray *webViewArray = @[@"http://www.baidu.com",@"http://www.baidu.com",@"http://www.baidu.com",@"http://www.baidu.com",@"http://www.baidu.com",@"http://www.baidu.com",@"http://www.baidu.com",@"http://www.baidu.com",@"http://www.baidu.com"];//对应的标题用对应的网址
    //分别展示每个page下面的webView
    for (NSInteger i = 0; i < self.titles.count; i++) {
        WebView *web = [[WebView alloc]init];
        NSString *str = [NSString stringWithFormat:@"%@",[webViewArray objectAtIndex:i]];
        NSURL *url = [NSURL URLWithString:str];
        NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
        [web loadRequest:urlRequest];
        [pageViews addObject:web];
    }
    return pageViews;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
