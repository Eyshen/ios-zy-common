//
//  UIScrollView+ZYFrame.h
//     _______________      __
//    /\______   /  \ \    / /
//    \/___  /  /    \ \  / /
//        / /  /      \ \/ /
//       / /  /        \/ /
//      / /  /______   / /
//     / /__________\ / /
//    /_____________/ \/
//
//  Created by Eason.zhangyi on 15/12/16.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (ZYFrame)

/**
 *  contentSize.width
 */
@property(nonatomic, assign) CGFloat zy_contnetWidth;

/**
 *  contentSize.height
 */
@property(nonatomic, assign) CGFloat zy_contentHeight;

/**
 *  contentOffset.x
 */
@property(nonatomic, assign) CGFloat zy_contentOffsetX;

/**
 *  contentOffset.y
 */
@property(nonatomic, assign) CGFloat zy_contentOffsetY;

/**
 *  contentInset.top
 */
@property(nonatomic, assign) CGFloat zy_contentInsetTop;

/**
 *  contentInset.bottom
 */
@property(nonatomic, assign) CGFloat zy_contentInsetBottom;

/**
 *  contentInset.left
 */
@property(nonatomic, assign) CGFloat zy_contentInsetLeft;

/**
 *  contentInset.right
 */
@property(nonatomic, assign) CGFloat zy_contentInsetRight;

@end
