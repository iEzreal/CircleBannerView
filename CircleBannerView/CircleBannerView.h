//
//  CircleBannerView.h
//  CircleBannerView
//
//  Created by Ezreal on 16/4/22.
//  Copyright © 2016年 Ezreal. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CircleBannerResourceType) {
    CircleBannerResourceTypeWeb,       // 网络图片
    CircleBannerResourceTypeLocal,    //  本地图片
};

typedef NS_ENUM(NSInteger, CircleBannerStyleType) {
    CircleBannerStyleTypeNormal,  // 不带标题
    CircleBannerStyleTypeTitle,   // 带标题
};

@class CircleBannerView;
@protocol CircleBannerViewDelegate <NSObject>

- (void)circleBannerView:(CircleBannerView *)circleBannerView didSelectPageAtIndex:(NSInteger)pageIndex;

@end

@interface CircleBannerView : UIView

@property(nonatomic, assign) CircleBannerStyleType styleType;
@property(nonatomic, assign) CircleBannerResourceType resourceType;
@property(nonatomic, copy) NSArray *imageArray;
@property(nonatomic, copy) NSArray *titleArray;

@property(nonatomic, assign) BOOL isAutoScroll; 

@property(nonatomic, weak) id<CircleBannerViewDelegate> delegate;


@end
