//
//  ZYUUIDUtils.m
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
//  Created by Eason.zhangyi on 15/7/29.
//  Copyright (c) 2016年 ZY. All rights reserved.
//

#import "ZYUUIDUtils.h"

@implementation ZYUUIDUtils

+(NSString *)UUID {
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    return [(__bridge_transfer NSString *)string stringByReplacingOccurrencesOfString:@"-" withString:@""];
}

@end
