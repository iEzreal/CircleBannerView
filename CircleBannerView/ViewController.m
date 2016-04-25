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
    [urlArray addObject:@"http://img5.imgtn.bdimg.com/it/u=2149796787,842171726&fm=206&gp=0.jpg"];
    [urlArray addObject:@"http://files.jb51.net/file_images/photoshop/201008/2010082021104513.jpg"];
    [urlArray addObject:@"http://www.zjsyxx.com/upload/personpic/2007710144115.jpg"];
    [urlArray addObject:@"http://www.xxjxsj.cn/article/UploadPic/2009-10/2009101018545196251.jpg"];
    
    _circleBannerView = [[CircleBannerView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 200)];
    _circleBannerView.styleType = CircleBannerStyleTypeTitle;
    _circleBannerView.resourceType = CircleBannerResourceTypeWeb;
    _circleBannerView.delegate = self;
    _circleBannerView.imageArray = urlArray;
    [self.view addSubview:_circleBannerView];
    
}

- (void)circleBannerView:(CircleBannerView *)circleBannerView didSelectPageAtIndex:(NSInteger)pageIndex {
    NSLog(@"----------------------------%ld", pageIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
