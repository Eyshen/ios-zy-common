//
//  ZYURLUtils.h
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

#import <Foundation/Foundation.h>


/**
 *  URL Param 工具类
 */
@interface ZYURLUtils : NSObject


/**
 *  取出URL中的参数词典
 *
 *  @param URL URL
 *
 *  @return 词典结果
 */
+ (NSDictionary *) paramsWithFormURL:(NSString *) URL;


/**
 *  将参数词典转换成字符串
 *
 *  @param params 参数
 *
 *  @return 结果字符串
 */
+ (NSString *) stringWithFormParams:(NSDictionary*) params;

/**
 *  去除URL中的参数
 *
 *  @param URL url
 *
 *  @return url
 */
+ (NSString *) removeURLParams:(NSString*) URL;

@end
