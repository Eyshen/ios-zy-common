//
//  UIColor+ZYExtension.h
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
//

#import <UIKit/UIKit.h>

#define ZY_COLOR_RGBA(r,g,b,a)              ([UIColor zy_colorWithRed:r green:g blue:b alpha:a])
#define ZY_COLOR_HEX(hex)                   ([UIColor zy_colorWithHex:hex])
#define ZY_COLOR_HEX_STRING(hexString)      ([UIColor zy_colorWithHexString:hexString])

@interface UIColor (ZYExtension)

+(UIColor*) zy_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

+(UIColor*) zy_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

//0x66377A
+(UIColor*) zy_colorWithHex:(int) hex;

//支持 @“#123456”、 @“0X123456”、 @“123456” 格式
+(UIColor*) zy_colorWithHexString:(NSString*) hexString;

@end
