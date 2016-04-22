//
//  CircleBannerView.m
//  CircleBannerView
//
//  Created by Ezreal on 16/4/22.
//  Copyright © 2016年 Ezreal. All rights reserved.
//

#import "CircleBannerView.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface CircleBannerView () <UIScrollViewDelegate>

@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) UIPageControl *pageControl;

@property(nonatomic, strong) UIImageView *leftImageView;
@property(nonatomic, strong) UIImageView *centerImageView;
@property(nonatomic, strong) UIImageView *rightImageView;

@property(nonatomic, strong) UITapGestureRecognizer *leftTapGesture;
@property(nonatomic, strong) UITapGestureRecognizer *centerTapGesture;
@property(nonatomic, strong) UITapGestureRecognizer *rightTapGesture;

@property(nonatomic, assign) NSInteger pageCount;

@property(nonatomic, assign) NSInteger currentPageIndex;

@end

@implementation CircleBannerView

- (instancetype)initWithFrame:(CGRect)frame {
    if (!(self = [super initWithFrame:frame])) {
        return nil;
    }
    
    [self setupPageViews];
    return self;
}

#pragma mark - 初始化页面视图
- (void)setupPageViews {
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(w * 3, h);
    _scrollView.contentOffset = CGPointMake(w, 0); // 显示中间的
    [self addSubview:_scrollView];
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, h - 25, w, 20)];
    [self addSubview:_pageControl];
    
    _leftTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pageClickWithSender:)];
    _leftImageView =[[UIImageView alloc] init];
    _leftImageView.frame = CGRectMake(w * 0, 0, w, h);
    _leftImageView.contentMode = UIViewContentModeScaleAspectFill;
    _leftImageView.userInteractionEnabled = YES;
    [_leftImageView addGestureRecognizer:_leftTapGesture];
    [_scrollView addSubview:_leftImageView];
    
    _centerTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pageClickWithSender:)];
    _centerImageView = [[UIImageView alloc] init];
    _centerImageView.frame = CGRectMake(w * 1, 0, w, h);
    _centerImageView.contentMode = UIViewContentModeScaleAspectFill;
    _centerImageView.userInteractionEnabled = YES;
    [_centerImageView addGestureRecognizer:_centerTapGesture];
    [_scrollView addSubview:_centerImageView];
    
    _rightTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pageClickWithSender:)];
    _rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(w * 2, 0, w, h)];
    _rightImageView.frame = CGRectMake(w * 2, 0, w, h);
    _rightImageView.contentMode = UIViewContentModeScaleAspectFill;
    _rightImageView.userInteractionEnabled = YES;
    [_rightImageView addGestureRecognizer:_rightTapGesture];
    [_scrollView addSubview:_rightImageView];
}

#pragma mark - 页面点击事件
- (void)pageClickWithSender:(UITapGestureRecognizer *)sender {
    if ([self.delegate respondsToSelector:@selector(circleBannerView:didSelectPageAtIndex:)]) {
        [self.delegate circleBannerView:self didSelectPageAtIndex:_currentPageIndex];
    }
}

#pragma mark - UIScrollViewDelegate（滚动停止事件）
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGPoint offset = [scrollView contentOffset];
    if (offset.x > scrollView.frame.size.width) {
        _currentPageIndex = (_currentPageIndex + 1) % _pageCount;
        
    } else if (offset.x < scrollView.frame.size.width){
        _currentPageIndex = (_currentPageIndex + _pageCount - 1) % _pageCount;
    }
    _pageControl.currentPage = _currentPageIndex;
    
    if (_bannerType == CircleBannerTypeWeb) {
        
        [self loadPegeWebImage];
    } else {
    
    }
}


- (void)loadPegeWebImage {
    NSInteger currentPageIndex = _currentPageIndex;
    NSInteger leftPageIndex = (_currentPageIndex + _pageCount - 1) % _pageCount;
    NSInteger rightPageIndex = (_currentPageIndex + 1) % _pageCount;
    
    [_centerImageView sd_setImageWithURL:[NSURL URLWithString:_imageURLArray[currentPageIndex]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    [_leftImageView sd_setImageWithURL:[NSURL URLWithString:_imageURLArray[leftPageIndex]]placeholderImage:[UIImage imageNamed:@"placeholder"]];
    [_rightImageView sd_setImageWithURL:[NSURL URLWithString:_imageURLArray[rightPageIndex]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    [_scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width, 0) animated:NO];
}

- (void)loadPageLocalImage {
    NSInteger currentPageIndex = _currentPageIndex;
    NSInteger leftPageIndex = (_currentPageIndex + _pageCount - 1) % _pageCount;
    NSInteger rightPageIndex = (_currentPageIndex + 1) % _pageCount;
    
    _leftImageView.image = [UIImage imageNamed:_imageNameArray[leftPageIndex]];
    _centerImageView.image = [UIImage imageNamed:_imageNameArray[currentPageIndex]];
    _rightImageView.image = [UIImage imageNamed:_imageNameArray[rightPageIndex]];
    
    [_scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width, 0) animated:NO];
}

- (void)setBannerType:(CircleBannerType)bannerType {
    _bannerType = bannerType;
}

- (void)setImageURLArray:(NSArray *)imageURLArray {
    if (imageURLArray) {
        _imageURLArray = imageURLArray;
        _pageCount = [_imageURLArray count];
        _pageControl.numberOfPages = _pageCount;
        _currentPageIndex = 0;
        [self loadPegeWebImage];

    } else{
        
    }
}

- (void)setImageNameArray:(NSArray *)imageNameArray {
    if (imageNameArray) {
        _imageNameArray = imageNameArray;
        _pageCount = [_imageURLArray count];
        _pageControl.numberOfPages = _pageCount;
        _currentPageIndex = 0;
        [self loadPageLocalImage];
    }
    
}


@end
