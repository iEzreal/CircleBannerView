//
//  ViewController.m
//  CircleBannerView
//
//  Created by Ezreal on 16/4/22.
//  Copyright © 2016年 Ezreal. All rights reserved.
//

#import "ViewController.h"
#import "CircleBannerView.h"

@interface ViewController () <CircleBannerViewDelegate>

@property(nonatomic, strong) CircleBannerView *circleBannerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"循环ScrollView";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    NSMutableArray *urlArray = [[NSMutableArray alloc] initWithCapacity:4];
    [urlArray addObject:@"http://img.taopic.com/uploads/allimg/120726/201994-120H623433555.jpg"];
    [urlArray addObject:@"http://pic24.nipic.com/20120920/10361578_112230424175_2.jpg"];
    [urlArray addObject:@"http://www.zjsyxx.com/upload/personpic/2007710144115.jpg"];
    [urlArray addObject:@"http://www.xxjxsj.cn/article/UploadPic/2009-10/2009101018545196251.jpg"];
    
    _circleBannerView = [[CircleBannerView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 150)];
    _circleBannerView.bannerType = CircleBannerTypeWeb;
    _circleBannerView.delegate = self;
    _circleBannerView.imageURLArray = urlArray;
    [self.view addSubview:_circleBannerView];
    
}

- (void)circleBannerView:(CircleBannerView *)circleBannerView didSelectPageAtIndex:(NSInteger)pageIndex {
    NSLog(@"----------------------------%ld", pageIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
