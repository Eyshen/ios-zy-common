//
//  IZYLoadingViewDelegate.h
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

@protocol IZYLoadingView;

/**
 *  加载视图委托
 */
@protocol IZYLoadingViewDelegate <NSObject>

/**
 *  加载刷新
 */
-(void) loadingRefresh:(UIView<IZYLoadingView>*) loadingView;

@end
