//
//  ZYStackView.h
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

#import "BaseZYView.h"

typedef NS_ENUM(NSInteger, ZYStackViewAxis) {
    ZYStackViewAxisHorizontal,
    ZYStackViewAxisVertical,
};


/**
 *  由于UIStackView 9.0 才支持，所以先使用一个简单的替换
 */
@interface ZYStackView : BaseZYView

@property (nonatomic, assign) ZYStackViewAxis axis;

- (NSArray*)arrangedSubviews;

- (void)removeArrangedSubview:(UIView*) view;

- (void)addArrangedSubview:(UIView *)view;

@end
