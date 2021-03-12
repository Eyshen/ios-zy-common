//
//  NSString+ZYURLEncode.h
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

#import <Foundation/Foundation.h>


#define ZY_STRING_URL_ENCODE(s)       [NSString zy_urlEncode:s]
#define ZY_STRING_URL_DECODE(s)       [NSString zy_urlDecode:s]

/**
 *  URL Encode
 */
@interface NSString (ZYURLEncode)


/**
 *  Encode（默认UTF8编码格式）
 */
+(NSString*) zy_urlEncode:(NSString*) url;

/**
 *  Decode（默认UTF8编码格式）
 */
+(NSString*) zy_urlDecode:(NSString*) url;


@end
