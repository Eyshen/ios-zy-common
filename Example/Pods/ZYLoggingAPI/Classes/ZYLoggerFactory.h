//
//  ZYLoggerFactory.h
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
//  Created by 张一 on 16-12-13.
//  Copyright (c) 2016年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IZYLogger.h"

/**
 *  日志记录器工厂
 */
@interface ZYLoggerFactory : NSObject

/**
 *  得到日志记录器
 */
+(id<IZYLogger>) getLogger;

@end
