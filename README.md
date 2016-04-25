# 无限循环轮播图
使用方法

	_circleBannerView = [[CircleBannerView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 200)];
    _circleBannerView.styleType = CircleBannerStyleTypeTitle;
    _circleBannerView.resourceType = CircleBannerResourceTypeWeb;
    _circleBannerView.delegate = self;
    _circleBannerView.imageArray = urlArray;
