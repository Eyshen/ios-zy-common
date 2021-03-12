//
//  ZYVersionUtils.m
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

#import "ZYVersionUtils.h"
#import <UIKit/UIDevice.h>

@implementation ZYVersionUtils

+(BOOL)currentSystemVersionGreaterThan:(NSString *)version {
    if (!version) {
        return NO;
    }
    return ([[[UIDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] == NSOrderedDescending);
}

+(BOOL)currentSystemVersionGreaterThanOrEqual:(NSString *)version {
    if (!version) {
        return NO;
    }
    return ([[[UIDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] != NSOrderedAscending);
}

+(BOOL)currentSystemVersionLessThan:(NSString *)version {
    if (!version) {
        return NO;
    }
    return ([[[UIDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] == NSOrderedAscending);
}

+(BOOL)currentSystemVersionLessThanOrEqual:(NSString *)version {
    if (!version) {
        return NO;
    }
    return ([[[UIDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] != NSOrderedDescending);
}

@end
