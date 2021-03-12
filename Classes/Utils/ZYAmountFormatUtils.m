//
//  ZYAmountFormatUtils.m
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

#import "ZYAmountFormatUtils.h"

@implementation ZYAmountFormatUtils

+(NSString *)formatAmountStr:(NSString *)origNum {
    if (origNum) {
        NSRange range = [origNum rangeOfString:@"." options:NSCaseInsensitiveSearch];
        if (range.location != NSNotFound) {
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            [formatter setPositiveFormat:@"###,##0.00;"];
            NSDecimalNumber *decimalNumber = [NSDecimalNumber decimalNumberWithString:origNum];
            return [formatter stringFromNumber:decimalNumber];
        } else {
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            formatter.numberStyle = NSNumberFormatterDecimalStyle;
            NSNumber *orginalNum = [NSNumber numberWithLongLong:[origNum longLongValue]];
            NSString *string = [formatter stringFromNumber:orginalNum];
            return string;
        }
    }
    return origNum;
}

+(NSString*)formatAmount2Decimal:(NSString*)origNum {
    if (origNum) {
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setPositiveFormat:@"###,##0.00;"];
        NSDecimalNumber *decimalNumber = [NSDecimalNumber decimalNumberWithString:origNum];
        return [formatter stringFromNumber:decimalNumber];
    }
    return origNum;
}

//无小数
+(NSString*)formatAmountNoDecimal:(NSString*)origNum {
    if (origNum) {
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setPositiveFormat:@"###,##0;"];
        NSDecimalNumber *decimalNumber = [NSDecimalNumber decimalNumberWithString:origNum];
        return [formatter stringFromNumber:decimalNumber];
    }
    return origNum;
}

@end
