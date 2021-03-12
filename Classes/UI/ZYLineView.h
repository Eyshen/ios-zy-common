//
//  BaseZYView.h
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

#import "BaseZYView.h"

/**
 *  线条绘制位置
 */
typedef NS_ENUM(NSInteger, ZYLineDrawPosition) {
    
    /**
     *  垂直居中
     */
    ZYLineDrawPositionVerticalCenter = 0,
    
    /**
     *  水平居中
     */
    ZYLineDrawPositionHorizontalCenter = 1,
    
    /**
     *  底部
     */
    ZYLineDrawPositionBottom = 2,
    
    /**
     *  顶部
     */
    ZYLineDrawPositionTop = 3,
    
    /**
     * 左边
     */
    ZYLineDrawPositionLeft = 4,
    
    /**
     * 右边
     */
    ZYLineDrawPositionRight = 5,
};

/**
 *  线条样式
 */
typedef NS_ENUM(NSInteger, ZYLineStyle) {
    
    /**
     * 实线
     */
    ZYLineStyleSolid = 0,
    
    /**
     * 虚线
     */
    ZYLineStyleDotted = 1,
};


/**
 *  线条视图
 */
@interface ZYLineView : BaseZYView

/**
 *  线条颜色
 */
@property (nonatomic, strong) UIColor *lineColor;

/**
 *  是否水平
 */
@property (nonatomic, assign) ZYLineDrawPosition drawPosition;

/**
 *  线条样式
 */
@property (nonatomic, assign) ZYLineStyle lineStyle;

/**
 *  线条宽度
 *  default     1/scale
 */
@property (nonatomic, assign) CGFloat lineWidth;

@end
