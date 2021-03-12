//
//  ZYVersionUtils.h
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

#import <Foundation/Foundation.h>

#define ZY_OS_VERSION_GREATER_THAN(version)              [ZYVersionUtils currentSystemVersionGreaterThan:version]
#define ZY_OS_VERSION_GREATER_THAN_OR_EQUAL(version)     [ZYVersionUtils currentSystemVersionGreaterThanOrEqual:version]
#define ZY_OS_VERSION_LESS_THAN(version)                 [ZYVersionUtils currentSystemVersionLessThan:version]
#define ZY_OS_VERSION_LESS_THAN_OR_EQUAL(version)        [ZYVersionUtils currentSystemVersionLessThanOrEqual:version]

@interface ZYVersionUtils : NSObject

/**
 *  当前版本大于等于version
 *
 *  @param version 版本号
 *
 *  @return 当前系统版本是否大于version
 */
+ (BOOL)currentSystemVersionGreaterThan:(NSString*)version;

/**
 *  当前版本大于等于version
 *
 *  @param version 版本号
 *
 *  @return 当前系统版本是否大于或等于version
 */
+ (BOOL)currentSystemVersionGreaterThanOrEqual:(NSString*)version;

/**
 *  当前系统版本小于Version
 *
 *  @param version 版本号
 *
 *  @return 当前系统版本是否小于version
 */
+ (BOOL)currentSystemVersionLessThan:(NSString*)version;

/**
 *  当前系统版本小于或等于Version
 *
 *  @param version 版本号
 *
 *  @return 当前系统版本是否小于或等于version
 */
+ (BOOL)currentSystemVersionLessThanOrEqual:(NSString*)version;

@end
