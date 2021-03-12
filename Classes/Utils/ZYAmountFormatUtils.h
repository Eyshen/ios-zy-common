//
//  ZYAmountFormatUtils.h
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

@interface ZYAmountFormatUtils : NSObject

//格式化金额字符串
+(NSString*)formatAmountStr:(NSString*)origNum;

//强制保留两位小数
+(NSString*)formatAmount2Decimal:(NSString*)origNum;

//无小数
+(NSString*)formatAmountNoDecimal:(NSString*)origNum;

@end
