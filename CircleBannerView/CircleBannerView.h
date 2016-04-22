//
//  CircleBannerView.h
//  CircleBannerView
//
//  Created by Ezreal on 16/4/22.
//  Copyright © 2016年 Ezreal. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CircleBannerType) {
    CircleBannerTypeWeb,       // 网络图片
    CircleBannerTypeLocal,    //  本地图片
};

@class CircleBannerView;
@protocol CircleBannerViewDelegate <NSObject>

- (void)circleBannerView:(CircleBannerView *)circleBannerView didSelectPageAtIndex:(NSInteger)pageIndex;

@end

@interface CircleBannerView : UIView

@property(nonatomic, assign) CircleBannerType bannerType;
@property(nonatomic, copy) NSArray *imageURLArray;
@property(nonatomic, copy) NSArray *imageNameArray;

@property(nonatomic, weak) id<CircleBannerViewDelegate> delegate;


@end
