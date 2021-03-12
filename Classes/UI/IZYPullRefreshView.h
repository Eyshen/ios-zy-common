//
//  IZYPullRefreshView.h
//     _______________      __
//    /\______   /  \ \    / /
//    \/___  /  /    \ \  / /
//        / /  /      \ \/ /
//       / /  /        \/ /
//      / /  /______   / /
//     / /__________\ / /
//    /_____________/ \/
//
//  Created by Eason.zhangyi on 16/7/29.
//  Copyright (c) 2016年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IZYPullRefreshStateView.h"


#define ZY_PULL_REFRESH_REGION_HEIGHT   60.0f


@protocol IZYPullRefreshViewDelegate;


/**
 *  下拉刷新视图
 */
@protocol IZYPullRefreshView <NSObject>

/**
 *  区域大小
 *
 *  default QW_REFRESH_REGION_HEIGHT
 */
@property (nonatomic, assign) CGFloat regionHeight;

/**
 *  委托
 */
@property (nonatomic, weak) id<IZYPullRefreshViewDelegate> delegate;

/**
 *  初始化方法
 *
 *  @param scrollView  滚动视图
 *  @param stateView   加载状态视图
 *
 *  @return 实例
 */
-(instancetype) initWithScrollView:(UIScrollView*) scrollView stateView:(UIView<IZYPullRefreshStateView>*) stateView;

/**
 *  模拟拖拽加载效果
 */
-(void) refreshScrollViewDidBeginLoading:(UIScrollView*) scrollView animated:(BOOL) animated;

/**
 *  UIScrollViewDelegate中 scrollViewDidScroll: 方法回调调用
 *
 *  @param scrollView 滚动视图
 */
-(void) refreshScrollViewDidScroll:(UIScrollView*) scrollView;

/**
 *  UIScrollViewDelegate中 scrollViewDidEndDragging:willDecelerate: 方法回调调用
 *
 *  @param scrollView 滚动视图
 */
-(void) refreshScrollViewDidEndDragging:(UIScrollView*) scrollView;

/**
 *  完成数据加载
 */
-(void) refreshScrollViewDidFinishedLoading:(UIScrollView *)scrollView;

/**
 *  数据加载完成
 *
 *  @param scrollView 所在滚动视图
 *  @param success    是否加载成功
 *  @param delay      加载结果显示时间
 */
-(void) refreshScrollViewDidFinishedLoading:(UIScrollView *)scrollView success:(BOOL) success delay:(NSTimeInterval) delay;

@end






/**
 *  上拉加载视图
 */
@protocol IZYPullRefreshFooterView <IZYPullRefreshView>

/**
 *  数据加载完成(数据是否已经全部加载完成)
 *
 *  default NO
 */
@property (nonatomic, assign) BOOL isFullData;

/**
 *  content size 更新
 */
-(void) refreshContentSize;

@end









/**
 *  上拉、下拉刷新委托
 */
@protocol IZYPullRefreshViewDelegate <NSObject>

/**
 *  触发刷新（开始刷新）
 */
- (BOOL) refreshDidTriggerRefresh:(UIView<IZYPullRefreshView>*)view;

@end
