//
//  ZYUUIDUtils.h
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

#import <Foundation/Foundation.h>

#define ZY_UUID         [ZYUUIDUtils UUID]

/**
 *  UUID 工具类
 */
@interface ZYUUIDUtils : NSObject

/**
 *  生成一个UUID字符串
 *
 *  @return 返回随机UUID
 */
+(NSString*) UUID;

@end
