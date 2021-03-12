//
//  URLParamUtil.m
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
//  Created by Eason.zhangyi on 15/8/13.
//  Copyright (c) 2016年 ZY. All rights reserved.
//

#import "ZYURLUtils.h"
#import "ZYStringUtils.h"

@implementation ZYURLUtils

+ (NSDictionary *) paramsWithFormURL:(NSString *) URL {
    if (!URL) {
        return nil;
    }
    NSArray *c1 = [URL componentsSeparatedByString:@"?"];
    NSString *paramsString = nil;
    if ([c1 count] == 2) {
        paramsString = c1[1];
    }
    if (paramsString) {
        NSMutableDictionary *result = [NSMutableDictionary dictionary];
        NSArray *pairs = [paramsString componentsSeparatedByString:@"&"];
        for (NSString *kvp in pairs) {
            if ([kvp length] == 0) {
                continue;
            }
            
            NSRange pos = [kvp rangeOfString:@"="];
            NSString *key;
            NSString *val;
            
            if (pos.location == NSNotFound) {
                key = [kvp stringByRemovingPercentEncoding];
                val = @"";
            } else {
                key = [[kvp substringToIndex:pos.location] stringByRemovingPercentEncoding];
                val = [[kvp substringFromIndex:pos.location + pos.length] stringByRemovingPercentEncoding];
            }
            if (!key || !val) {
                continue;
            }
            
            [result setObject:val forKey:key];
        }
        return result;
    }
    return nil;
}

+ (NSString *) stringWithFormParams:(NSDictionary*) params {
    if ([params count] > 0) {
        NSMutableArray *arguments = [NSMutableArray arrayWithCapacity:[params count]];
        [params enumerateKeysAndObjectsUsingBlock:^(id key, id object, BOOL *stop) {
            [arguments addObject:[NSString stringWithFormat:@"%@=%@",
                                  [key stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]],
                                  [[object description] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]]];
        }];
        return [arguments componentsJoinedByString:@"&"];
    }
    return nil;
}

+(NSString *)removeURLParams:(NSString *)URL {
    if ([ZYStringUtils isNotBlank:URL]) {
        return [URL componentsSeparatedByString:@"?"][0];
    }
    return nil;
}

@end
