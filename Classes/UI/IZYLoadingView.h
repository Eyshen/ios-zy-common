//
//  IZYLoadingView.h
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
#import "IZYLoadingViewDelegate.h"

/**
 *  加载状态
 */
typedef NS_ENUM(NSInteger, ZYLoadingState) {
    
    /**
     *  加载中
     */
    ZYLoadingStateLoading = 0,
    
    /**
     *  自定义 img msg
     */
    ZYLoadingStateCustom = 1,
    
    /**
     *  无网络
     */
    ZYLoadingStateNetworkOff = 2,
    
    /**
     *  无数据
     */
    ZYLoadingStateEmptyData = 3,
    
    /**
     *  加载完成
     */
    ZYLoadingStateFinished = 4,
};

/**
 *  加载数据视图
 */
@protocol IZYLoadingView <NSObject>

/**
 *  当前加载状态
 *
 *  default ZYLoadingStateLoading
 */
@property (nonatomic, assign) ZYLoadingState state;

/**
 *  自定义状态图片
 */
@property(nonatomic, copy) NSString *customStateImageName;

/**
 *  自定义状态文本
 */
@property(nonatomic, copy) NSString *customStateText;

/**
 *  加载状态图片名称
 */
@property(nonatomic, copy) NSString *loadingStateImageName;

/**
 *  加载状态时文本
 */
@property(nonatomic, copy) NSString *loadingStateText;

/**
 *  空值图片名称
 */
@property (nonatomic, copy) NSString *emptyDataStateImageName;

/**
 *  空值显示文本
 */
@property (nonatomic, copy) NSString *emptyDataStateText;

/**
 *  无网络图片名称
 */
@property(nonatomic, copy) NSString *networkOffStateImageName;

/**
 *  无网络文本
 */
@property(nonatomic, copy) NSString *networkOffStateText;

/**
 *  委托
 */
@property (nonatomic, weak) id<IZYLoadingViewDelegate> delegate;

/**
 *  偏移Y default 0.0f
 */
@property (nonatomic, assign) CGFloat offsetY;


@end



