//
//  UIScreen+ZYE.h
//     _______________      __
//    /\______   /  \ \    / /
//    \/___  /  /    \ \  / /
//        / /  /      \ \/ /
//       / /  /        \/ /
//      / /  /______   / /
//     / /__________\ / /
//    /_____________/ \/
//
//  Created by Eason.zhangyi on 16/1/5.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>


#define ZY_SCREEN_SIZE              [UIScreen size]
#define ZY_SCREEN_SCALE             [UIScreen scale]
#define ZY_SCREEN_WIDTH             [UIScreen width]
#define ZY_SCREEN_HEIGHT            [UIScreen height]
#define ZY_SCREEN_APPLICATION_Frame [UIScreen applicationFrame]
#define ZY_SCREEN_BOUNDS            [UIScreen bounds]
#define ZY_IS_IPHONEX               ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 *  @author 吴云海
 *
 *  UIScreen 扩展
 */
@interface UIScreen (ZYExtension)

/**
 *  屏幕 bounds
 */
+(CGRect) bounds;

+(CGRect) applicationFrame;

/**
 *  屏幕宽
 */
+(CGFloat) width;

/**
 *  屏幕高
 */
+(CGFloat) height;

/**
 *  屏幕比例
 */
+(CGFloat) scale;

/**
 *  屏幕大小
 */
+(CGSize) size;

@end
