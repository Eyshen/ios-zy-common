//
//  ZYVerticalButton.h
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

#import "BaseZYButton.h"


/**
 *  垂直Button(图片在上，文字在下)
 *  note:各种状态图片最好要相同大小
 */
@interface ZYVerticalButton : BaseZYButton

/**
 *  图片与文字间距
 *  default 0.0f
 */
@property(nonatomic, assign) CGFloat spacing;

/**
 *  设置字体
 */
-(void)zy_setFont:(UIFont*)font;


@end
