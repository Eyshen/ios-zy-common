//
//  IZYPullRefreshLoadingView.h
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


/**
 *  上下拉刷新状态
 */
typedef NS_ENUM(NSInteger, ZYPullRefreshState) {
    
    /**
     *  无
     */
    ZYPullRefreshStateNone = 0,
    
    /**
     *  拉动状态
     */
    ZYPullRefreshStatePulling = 1,
    
    /**
     *  正常状态
     */
    ZYPullRefreshStateNormal = 2,
    
    /**
     *  加载状态
     */
    ZYPullRefreshStateLoading = 3,
    
    /**
     *  加载成功
     */
    ZYPullRefreshStateFinish = 4,
    
    /**
     *  加载失败
     */
    ZYPullRefreshStateFail = 5,
    
    /**
     *  数据全部加载完成（只有加载更多数据才有）
     */
    ZYPullRefreshStateFull,
};


/**
 *  加载状态视图
 */
@protocol IZYPullRefreshStateView <NSObject>

/**
 *  设置状态
 *
 *  @param aState     状态
 *  @param scrollView 滚动视图
 */
-(void) setState:(ZYPullRefreshState) aState scrollView:(UIScrollView*) scrollView;

@end
