//
//  NSString+ZYURLEncode.m
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
//  Created by Eason.zhangyi on 16/1/15.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "NSString+ZYURLEncode.h"

@implementation NSString (ZYURLEncode)

+(NSString *)zy_urlEncode:(NSString *)s {
    return [s stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

+(NSString *)zy_urlDecode:(NSString *)s {
    return [s stringByRemovingPercentEncoding];
}

@end
