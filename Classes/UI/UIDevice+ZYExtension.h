//
//  UIDevice+ZYExtension.h
//
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

#define ZY_DEVICE_OS_VERSION                            [UIDevice osVersion]
#define ZY_DEVICE_IS_DEVICE_PHONE                       [UIDevice isDevicePhone]
#define ZY_DEVICE_IS_PHONE                              [UIDevice isPhone]
#define ZY_DEVICE_IS_POD                                [UIDevice isPod]
#define ZY_DEVICE_IS_TOUCH                              [UIDevice isTouch]
#define ZY_DEVICE_IS_PAD                                [UIDevice isPad]

@interface UIDevice (ZYExtension)

/**
 *  iOS 系统版本
 */
+(NSString*) osVersion;

/**
 *  是否为手机设备设备(iPhone、iPod、iTouch)
 */
+ (BOOL)isDevicePhone;

/**
 *  是否为iPhone
 */
+ (BOOL) isPhone;

/**
 *  是否为iPod
 */
+ (BOOL) isPod;

/**
 *  是否为iTouch
 */
+ (BOOL) isTouch;

/**
 *  是否为iPad设备
 */
+ (BOOL)isPad;

@end
