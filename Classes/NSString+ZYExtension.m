//
//  NSString+ZYExtension.m
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
//  Created by Eason.zhangyi on 15/12/16.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "NSString+ZYExtension.h"
#import "NSArray+ZYExtension.h"

static NSString *const UNDERSCORE = @"_";
static NSString *const SPACE = @" ";
static NSString *const EMPTY_STRING = @"";

NSString *NSStringWithFormat(NSString *formatString, ...) {
    va_list args;
    va_start(args, formatString);
    
    NSString *string = [[NSString alloc] initWithFormat:formatString arguments:args];
    
    va_end(args);
    
#if defined(__has_feature) && __has_feature(objc_arc)
    return string;
#else
    return [string autorelease];
#endif
}


@implementation NSString (ZYExtension)

- (NSArray *) zy_split {
    NSArray *result = [self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return [result zy_select:^BOOL(NSString *string) {
        return string.length > 0;
    }];
}

- (NSArray *) zy_split:(NSString *)delimiter {
    return [self componentsSeparatedByString:delimiter];
}

- (NSString *) zy_camelCase {
    NSString *spaced = [self stringByReplacingOccurrencesOfString:UNDERSCORE withString:SPACE];
    NSString *capitalized = [spaced capitalizedString];
    
    return [capitalized stringByReplacingOccurrencesOfString:SPACE withString:EMPTY_STRING];
}

- (BOOL) zy_containsString:(NSString *) string {
    NSRange range = [self rangeOfString:string options:NSCaseInsensitiveSearch];
    return range.location != NSNotFound;
}

- (NSString *) zy_strip {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
